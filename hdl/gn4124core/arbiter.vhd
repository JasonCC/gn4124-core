-------------------------------------------------------------------------------
--                                                                           --
-- CERN BE-CO-HT         GN4124 core for PCIe FMC carrier                    --
--                       http://www.ohwr.org/projects/gn4124-core            --
-------------------------------------------------------------------------------
--
-- unit name: GN4124 core arbiter (arbiter.vhd)
--
-- author: Simon Deprez (simon.deprez@cern.ch)
--
-- date: 07-06-2010
--
-- version: 0.1
--
-- description: Arbitrate between Wishbone master, DMA master and DMA pdmuencer
--
-- dependencies: 
--
-------------------------------------------------------------------------------
-- last changes:
--       - 08-06-2010, 
-------------------------------------------------------------------------------
-- TODO: -
--       -
--       -
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arbiter is
	port
	( 
		---------------------------------------------------------
		---------------------------------------------------------
		-- Clock/Reset
		--
		clk_i             : in   STD_ULOGIC;
		rst_i             : in   STD_ULOGIC;
		---------------------------------------------------------
		---------------------------------------------------------
		-- From Wishbone master (wbm) to arbiter (arb)
		--
		wbm_arb_valid_i  : in  STD_ULOGIC;
		wbm_arb_dframe_i : in  STD_ULOGIC;
		wbm_arb_data_i   : in  STD_ULOGIC_VECTOR(31 downto 0);
		wbm_arb_req_i    : in  STD_ULOGIC;
		arb_wbm_gnt_o    : out STD_ULOGIC;
		--
		---------------------------------------------------------
		---------------------------------------------------------
		-- From DMA pdmuencer (pdm) to arbiter (arb)
		--
		pdm_arb_valid_i  : in  STD_ULOGIC;
		pdm_arb_dframe_i : in  STD_ULOGIC;
		pdm_arb_data_i   : in  STD_ULOGIC_VECTOR(31 downto 0);
		pdm_arb_req_i    : in  STD_ULOGIC;
		arb_pdm_gnt_o    : out STD_ULOGIC;
		--
		---------------------------------------------------------
		---------------------------------------------------------
		-- From P2L DMA master (ldm) to arbiter (arb)
		--
		ldm_arb_valid_i  : in  STD_ULOGIC;
		ldm_arb_dframe_i : in  STD_ULOGIC;
		ldm_arb_data_i   : in  STD_ULOGIC_VECTOR(31 downto 0);
		ldm_arb_req_i    : in  STD_ULOGIC;
		arb_ldm_gnt_o    : out STD_ULOGIC;
		--
		---------------------------------------------------------

		---------------------------------------------------------
		-- From arbiter (arb) to serializer (ser)
		--
		arb_ser_valid_o  : out STD_ULOGIC;
		arb_ser_dframe_o : out STD_ULOGIC;
		arb_ser_data_o   : out STD_ULOGIC_VECTOR(31 downto 0)
		--
		---------------------------------------------------------
	);
end arbiter;

architecture behaviour of arbiter is
    ---------------------------------------------------------
    -- Signal declarations
    --
    signal   wbm_arb_req_valid : STD_ULOGIC;
    signal   pdm_arb_req_valid : STD_ULOGIC;
    signal   ldm_arb_req_valid : STD_ULOGIC;
    signal   arb_req_valid     : STD_ULOGIC;
    signal   arb_wbm_gnt       : STD_ULOGIC;
    signal   arb_pdm_gnt       : STD_ULOGIC;
    signal   arb_ldm_gnt       : STD_ULOGIC;
    signal   eop               : STD_ULOGIC;  -- End of packet
    --
    ---------------------------------------------------------
begin
    wbm_arb_req_valid <= wbm_arb_req_i;
    pdm_arb_req_valid <= pdm_arb_req_i;
    ldm_arb_req_valid <= ldm_arb_req_i;

    -- Detect any valid request to allow arbitration
    arb_req_valid     <= (wbm_arb_req_valid or pdm_arb_req_valid or ldm_arb_req_valid) and
                         (not arb_wbm_gnt and not arb_pdm_gnt and not arb_ldm_gnt); 

    -- Detect end of packet to delimit the arbitration phase
    eop               <= ((arb_wbm_gnt and not wbm_arb_dframe_i) or 
                          (arb_pdm_gnt and not pdm_arb_dframe_i) or 
                          (arb_ldm_gnt and not ldm_arb_dframe_i)); 

   -----------------------------------------------------------------------------
   -- Arbitration is started when a valid request is present and ends when the
   -- EOP condition is detected
   --
   -- Strict priority arbitration scheme
   -- Highest : WBM request
   --         : LDM request
   -- Lowest  : pdm request
   -----------------------------------------------------------------------------


	process (clk_i, rst_i)
	begin  
		if(rst_i = '1') then
      arb_wbm_gnt <= '0';
      arb_pdm_gnt <= '0';
      arb_ldm_gnt <= '0';
		elsif (clk_i'event and clk_i = '1') then
      if (arb_req_valid = '1') then
        if (wbm_arb_req_valid = '1') then
          arb_wbm_gnt <= '1';
          arb_pdm_gnt <= '0';
          arb_ldm_gnt <= '0';
        elsif (ldm_arb_req_valid = '1') then
          arb_wbm_gnt <= '0';
          arb_pdm_gnt <= '0';
          arb_ldm_gnt <= '1';
        elsif (pdm_arb_req_valid = '1') then
          arb_wbm_gnt <= '0';
          arb_pdm_gnt <= '1';
          arb_ldm_gnt <= '0';
        else
          arb_wbm_gnt <= '0';
          arb_pdm_gnt <= '0';
          arb_ldm_gnt <= '0';
        end if;
      elsif (eop = '1') then
        arb_wbm_gnt <= '0';
        arb_pdm_gnt <= '0';
        arb_ldm_gnt <= '0';
      end if;
    end if;
  end process;

arb_ser_valid_o    <= wbm_arb_valid_i  when (arb_wbm_gnt = '1') else
                      pdm_arb_valid_i  when (arb_pdm_gnt = '1') else
                      ldm_arb_valid_i  when (arb_ldm_gnt = '1') else '0';

arb_ser_dframe_o   <= wbm_arb_dframe_i when (arb_wbm_gnt = '1') else
                      pdm_arb_dframe_i when (arb_pdm_gnt = '1') else
                      ldm_arb_dframe_i when (arb_ldm_gnt = '1') else '0';

arb_ser_data_o     <= wbm_arb_data_i   when (arb_wbm_gnt = '1') else
                      pdm_arb_data_i   when (arb_pdm_gnt = '1') else
                      ldm_arb_data_i   when (arb_ldm_gnt = '1') else x"00000000";

arb_wbm_gnt_o      <= arb_wbm_gnt ;
arb_pdm_gnt_o      <= arb_pdm_gnt ;
arb_ldm_gnt_o      <= arb_ldm_gnt ;

end behaviour;
