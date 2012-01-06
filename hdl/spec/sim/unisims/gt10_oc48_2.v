///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  10-Gigabit Transceiver for OC48 I/O Standard 2 Byte Data
// /___/   /\     Filename : GT10_OC48_2.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:19 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/22/06 - CR#226003 - Added integer, real parameter type

`timescale 1 ps / 1 ps 

module GT10_OC48_2 (
	CHBONDDONE,
	CHBONDO,
	PMARXLOCK,
	RXBUFSTATUS,
	RXCHARISCOMMA,
	RXCHARISK,
	RXCLKCORCNT,
	RXCOMMADET,
	RXDATA,
	RXDISPERR,
	RXLOSSOFSYNC,
	RXNOTINTABLE,
	RXREALIGN,
	RXRECCLK,
	RXRUNDISP,
	TXBUFERR,
	TXKERR,
	TXN,
	TXOUTCLK,
	TXP,
	TXRUNDISP,

	BREFCLKNIN,
	BREFCLKPIN,
	CHBONDI,
	ENCHANSYNC,
	ENMCOMMAALIGN,
	ENPCOMMAALIGN,
	LOOPBACK,
	PMAINIT,
	PMAREGADDR,
	PMAREGDATAIN,
	PMAREGRW,
	PMAREGSTROBE,
	PMARXLOCKSEL,
	POWERDOWN,
	REFCLK,
	REFCLK2,
	REFCLKBSEL,
	REFCLKSEL,
	RXBLOCKSYNC64B66BUSE,
	RXCOMMADETUSE,
	RXDATAWIDTH,
	RXDEC64B66BUSE,
	RXDEC8B10BUSE,
	RXDESCRAM64B66BUSE,
	RXIGNOREBTF,
	RXINTDATAWIDTH,
	RXN,
	RXP,
	RXPOLARITY,
	RXRESET,
	RXSLIDE,
	RXUSRCLK,
	RXUSRCLK2,
	TXBYPASS8B10B,
	TXCHARDISPMODE,
	TXCHARDISPVAL,
	TXCHARISK,
	TXDATA,
	TXDATAWIDTH,
	TXENC64B66BUSE,
	TXENC8B10BUSE,
	TXGEARBOX64B66BUSE,
	TXINHIBIT,
	TXINTDATAWIDTH,
	TXPOLARITY,
	TXRESET,
	TXSCRAM64B66BUSE,
	TXUSRCLK,
	TXUSRCLK2
);

parameter integer ALIGN_COMMA_WORD = 1;
parameter DEC_MCOMMA_DETECT = "TRUE";
parameter DEC_PCOMMA_DETECT = "TRUE";
parameter MCOMMA_10B_VALUE = 10'b0010101010;
parameter MCOMMA_DETECT = "TRUE";
parameter PCOMMA_10B_VALUE = 10'b0010101010;
parameter PCOMMA_DETECT = "TRUE";
parameter PMA_PWR_CNTRL = 8'b11111111;
parameter PMA_SPEED_HEX = 120'h00fc0d300b0f304830680901050820;
parameter PMA_SPEED_USE = "PMA_SPEED";
parameter RX_BUFFER_USE = "TRUE";
parameter integer RX_LOS_INVALID_INCR = 1;
parameter integer RX_LOS_THRESHOLD = 4;
parameter RX_LOSS_OF_SYNC_FSM = "TRUE";
parameter TX_BUFFER_USE = "TRUE";

output CHBONDDONE;
output [4:0] CHBONDO;
output PMARXLOCK;
output [1:0] RXBUFSTATUS;
output [1:0] RXCHARISCOMMA;
output [1:0] RXCHARISK;
output [2:0] RXCLKCORCNT;
output RXCOMMADET;
output [15:0] RXDATA;
output [1:0] RXDISPERR;
output [1:0] RXLOSSOFSYNC;
output [1:0] RXNOTINTABLE;
output RXREALIGN;
output RXRECCLK;
output [1:0] RXRUNDISP;
output TXBUFERR;
output [1:0] TXKERR;
output TXN;
output TXOUTCLK;
output TXP;
output [1:0] TXRUNDISP;

input BREFCLKNIN;
input BREFCLKPIN;
input [4:0] CHBONDI;
input ENCHANSYNC;
input ENMCOMMAALIGN;
input ENPCOMMAALIGN;
input [1:0] LOOPBACK;
input PMAINIT;
input [5:0] PMAREGADDR;
input [7:0] PMAREGDATAIN;
input PMAREGRW;
input PMAREGSTROBE;
input [1:0] PMARXLOCKSEL;
input POWERDOWN;
input REFCLK;
input REFCLK2;
input REFCLKBSEL;
input REFCLKSEL;
input RXBLOCKSYNC64B66BUSE;
input RXCOMMADETUSE;
input [1:0] RXDATAWIDTH;
input RXDEC64B66BUSE;
input RXDEC8B10BUSE;
input RXDESCRAM64B66BUSE;
input RXIGNOREBTF;
input [1:0] RXINTDATAWIDTH;
input RXN;
input RXP;
input RXPOLARITY;
input RXRESET;
input RXSLIDE;
input RXUSRCLK;
input RXUSRCLK2;
input [1:0] TXBYPASS8B10B;
input [1:0] TXCHARDISPMODE;
input [1:0] TXCHARDISPVAL;
input [1:0] TXCHARISK;
input [15:0] TXDATA;
input [1:0] TXDATAWIDTH;
input TXENC64B66BUSE;
input TXENC8B10BUSE;
input TXGEARBOX64B66BUSE;
input TXINHIBIT;
input [1:0] TXINTDATAWIDTH;
input TXPOLARITY;
input TXRESET;
input TXSCRAM64B66BUSE;
input TXUSRCLK;
input TXUSRCLK2;

wire [5:0] OPEN_RXCHARISCOMMA;
wire [5:0] OPEN_RXCHARISK;
wire [47:0] OPEN_RXDATA;
wire [5:0] OPEN_RXDISPERR;
wire [5:0] OPEN_RXNOTINTABLE;
wire [5:0] OPEN_RXRUNDISP;
wire [5:0] OPEN_TXKERR;
wire [5:0] OPEN_TXRUNDISP;

GT10 gt10_1 (
	.CHBONDDONE (CHBONDDONE),
	.CHBONDO (CHBONDO),
	.PMARXLOCK (PMARXLOCK),
	.RXBUFSTATUS (RXBUFSTATUS),
	.RXCHARISCOMMA ({OPEN_RXCHARISCOMMA, RXCHARISCOMMA}),
	.RXCHARISK ({OPEN_RXCHARISK, RXCHARISK}),
	.RXCLKCORCNT (RXCLKCORCNT),
	.RXCOMMADET (RXCOMMADET),
	.RXDATA ({OPEN_RXDATA, RXDATA}),
	.RXDISPERR ({OPEN_RXDISPERR, RXDISPERR}),
	.RXLOSSOFSYNC (RXLOSSOFSYNC),
	.RXNOTINTABLE ({OPEN_RXNOTINTABLE, RXNOTINTABLE}),
	.RXREALIGN (RXREALIGN),
	.RXRECCLK (RXRECCLK),
	.RXRUNDISP ({OPEN_RXRUNDISP, RXRUNDISP}),
	.TXBUFERR (TXBUFERR),
	.TXKERR ({OPEN_TXKERR, TXKERR}),
	.TXN (TXN),
	.TXOUTCLK (TXOUTCLK),
	.TXP (TXP),
	.TXRUNDISP ({OPEN_TXRUNDISP, TXRUNDISP}),
	.BREFCLKNIN (BREFCLKNIN),
	.BREFCLKPIN (BREFCLKPIN),
	.CHBONDI (CHBONDI),
	.ENCHANSYNC (ENCHANSYNC),
	.ENMCOMMAALIGN (ENMCOMMAALIGN),
	.ENPCOMMAALIGN (ENPCOMMAALIGN),
	.LOOPBACK (LOOPBACK),
	.PMAINIT (PMAINIT),
	.PMAREGADDR (PMAREGADDR),
	.PMAREGDATAIN (PMAREGDATAIN),
	.PMAREGRW (PMAREGRW),
	.PMAREGSTROBE (PMAREGSTROBE),
	.PMARXLOCKSEL (PMARXLOCKSEL),
	.POWERDOWN (POWERDOWN),
	.REFCLK (REFCLK),
	.REFCLK2 (REFCLK2),
	.REFCLKBSEL (REFCLKBSEL),
	.REFCLKSEL (REFCLKSEL),
	.RXBLOCKSYNC64B66BUSE (RXBLOCKSYNC64B66BUSE),
	.RXCOMMADETUSE (RXCOMMADETUSE),
	.RXDATAWIDTH (RXDATAWIDTH),
	.RXDEC64B66BUSE (RXDEC64B66BUSE),
	.RXDEC8B10BUSE (RXDEC8B10BUSE),
	.RXDESCRAM64B66BUSE (RXDESCRAM64B66BUSE),
	.RXIGNOREBTF (RXIGNOREBTF),
	.RXINTDATAWIDTH (RXINTDATAWIDTH),
	.RXN (RXN),
	.RXP (RXP),
	.RXPOLARITY (RXPOLARITY),
	.RXRESET (RXRESET),
	.RXSLIDE (RXSLIDE),
	.RXUSRCLK (RXUSRCLK),
	.RXUSRCLK2 (RXUSRCLK2),
	.TXBYPASS8B10B ({6'b0, TXBYPASS8B10B}),
	.TXCHARDISPMODE ({6'b0, TXCHARDISPMODE}),
	.TXCHARDISPVAL ({6'b0, TXCHARDISPVAL}),
	.TXCHARISK ({6'b0, TXCHARISK}),
	.TXDATA ({48'b0, TXDATA}),
	.TXDATAWIDTH (TXDATAWIDTH),
	.TXENC64B66BUSE (TXENC64B66BUSE),
	.TXENC8B10BUSE (TXENC8B10BUSE),
	.TXGEARBOX64B66BUSE (TXGEARBOX64B66BUSE),
	.TXINHIBIT (TXINHIBIT),
	.TXINTDATAWIDTH (TXINTDATAWIDTH),
	.TXPOLARITY (TXPOLARITY),
	.TXRESET (TXRESET),
	.TXSCRAM64B66BUSE (TXSCRAM64B66BUSE),
	.TXUSRCLK (TXUSRCLK),
	.TXUSRCLK2 (TXUSRCLK2)
);

defparam gt10_1.ALIGN_COMMA_WORD = ALIGN_COMMA_WORD;
defparam gt10_1.COMMA_10B_MASK = 10'b0011111111;
defparam gt10_1.DEC_MCOMMA_DETECT = DEC_MCOMMA_DETECT;
defparam gt10_1.DEC_PCOMMA_DETECT = DEC_PCOMMA_DETECT;
defparam gt10_1.MCOMMA_10B_VALUE = MCOMMA_10B_VALUE;
defparam gt10_1.MCOMMA_DETECT = MCOMMA_DETECT;
defparam gt10_1.PCOMMA_10B_VALUE = PCOMMA_10B_VALUE;
defparam gt10_1.PCOMMA_DETECT = PCOMMA_DETECT;
defparam gt10_1.PMA_PWR_CNTRL = PMA_PWR_CNTRL;
defparam gt10_1.PMA_SPEED = "31_16";
defparam gt10_1.PMA_SPEED_HEX = PMA_SPEED_HEX;
defparam gt10_1.PMA_SPEED_USE = PMA_SPEED_USE;
defparam gt10_1.RX_BUFFER_USE = RX_BUFFER_USE;
defparam gt10_1.RX_LOS_INVALID_INCR = RX_LOS_INVALID_INCR;
defparam gt10_1.RX_LOS_THRESHOLD = RX_LOS_THRESHOLD;
defparam gt10_1.RX_LOSS_OF_SYNC_FSM = RX_LOSS_OF_SYNC_FSM;
defparam gt10_1.TX_BUFFER_USE = TX_BUFFER_USE;

endmodule
