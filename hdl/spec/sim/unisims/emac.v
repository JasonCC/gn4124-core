///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Ethernet Media Access Controller
// /___/   /\     Filename : EMAC.v
// \   \  /  \    Timestamp : Fri Jun 18 10:57:22 PDT 2004
//  \___\/\___\
//
// Revision:
//    12/07/07 - CR 455025 - Added delays for 16 bit client mode.
//    03/23/04 - Initial version.

`timescale 1 ps / 1 ps 

module EMAC (
	DCRHOSTDONEIR,
	EMAC0CLIENTANINTERRUPT,
	EMAC0CLIENTRXBADFRAME,
	EMAC0CLIENTRXCLIENTCLKOUT,
	EMAC0CLIENTRXD,
	EMAC0CLIENTRXDVLD,
	EMAC0CLIENTRXDVLDMSW,
	EMAC0CLIENTRXDVREG6,
	EMAC0CLIENTRXFRAMEDROP,
	EMAC0CLIENTRXGOODFRAME,
	EMAC0CLIENTRXSTATS,
	EMAC0CLIENTRXSTATSBYTEVLD,
	EMAC0CLIENTRXSTATSVLD,
	EMAC0CLIENTTXACK,
	EMAC0CLIENTTXCLIENTCLKOUT,
	EMAC0CLIENTTXCOLLISION,
	EMAC0CLIENTTXGMIIMIICLKOUT,
	EMAC0CLIENTTXRETRANSMIT,
	EMAC0CLIENTTXSTATS,
	EMAC0CLIENTTXSTATSBYTEVLD,
	EMAC0CLIENTTXSTATSVLD,
	EMAC0PHYENCOMMAALIGN,
	EMAC0PHYLOOPBACKMSB,
	EMAC0PHYMCLKOUT,
	EMAC0PHYMDOUT,
	EMAC0PHYMDTRI,
	EMAC0PHYMGTRXRESET,
	EMAC0PHYMGTTXRESET,
	EMAC0PHYPOWERDOWN,
	EMAC0PHYSYNCACQSTATUS,
	EMAC0PHYTXCHARDISPMODE,
	EMAC0PHYTXCHARDISPVAL,
	EMAC0PHYTXCHARISK,
	EMAC0PHYTXCLK,
	EMAC0PHYTXD,
	EMAC0PHYTXEN,
	EMAC0PHYTXER,
	EMAC1CLIENTANINTERRUPT,
	EMAC1CLIENTRXBADFRAME,
	EMAC1CLIENTRXCLIENTCLKOUT,
	EMAC1CLIENTRXD,
	EMAC1CLIENTRXDVLD,
	EMAC1CLIENTRXDVLDMSW,
	EMAC1CLIENTRXDVREG6,
	EMAC1CLIENTRXFRAMEDROP,
	EMAC1CLIENTRXGOODFRAME,
	EMAC1CLIENTRXSTATS,
	EMAC1CLIENTRXSTATSBYTEVLD,
	EMAC1CLIENTRXSTATSVLD,
	EMAC1CLIENTTXACK,
	EMAC1CLIENTTXCLIENTCLKOUT,
	EMAC1CLIENTTXCOLLISION,
	EMAC1CLIENTTXGMIIMIICLKOUT,
	EMAC1CLIENTTXRETRANSMIT,
	EMAC1CLIENTTXSTATS,
	EMAC1CLIENTTXSTATSBYTEVLD,
	EMAC1CLIENTTXSTATSVLD,
	EMAC1PHYENCOMMAALIGN,
	EMAC1PHYLOOPBACKMSB,
	EMAC1PHYMCLKOUT,
	EMAC1PHYMDOUT,
	EMAC1PHYMDTRI,
	EMAC1PHYMGTRXRESET,
	EMAC1PHYMGTTXRESET,
	EMAC1PHYPOWERDOWN,
	EMAC1PHYSYNCACQSTATUS,
	EMAC1PHYTXCHARDISPMODE,
	EMAC1PHYTXCHARDISPVAL,
	EMAC1PHYTXCHARISK,
	EMAC1PHYTXCLK,
	EMAC1PHYTXD,
	EMAC1PHYTXEN,
	EMAC1PHYTXER,
	EMACDCRACK,
	EMACDCRDBUS,
	HOSTMIIMRDY,
	HOSTRDDATA,
	CLIENTEMAC0DCMLOCKED,
	CLIENTEMAC0PAUSEREQ,
	CLIENTEMAC0PAUSEVAL,
	CLIENTEMAC0RXCLIENTCLKIN,
	CLIENTEMAC0TXCLIENTCLKIN,
	CLIENTEMAC0TXD,
	CLIENTEMAC0TXDVLD,
	CLIENTEMAC0TXDVLDMSW,
	CLIENTEMAC0TXFIRSTBYTE,
	CLIENTEMAC0TXGMIIMIICLKIN,
	CLIENTEMAC0TXIFGDELAY,
	CLIENTEMAC0TXUNDERRUN,
	CLIENTEMAC1DCMLOCKED,
	CLIENTEMAC1PAUSEREQ,
	CLIENTEMAC1PAUSEVAL,
	CLIENTEMAC1RXCLIENTCLKIN,
	CLIENTEMAC1TXCLIENTCLKIN,
	CLIENTEMAC1TXD,
	CLIENTEMAC1TXDVLD,
	CLIENTEMAC1TXDVLDMSW,
	CLIENTEMAC1TXFIRSTBYTE,
	CLIENTEMAC1TXGMIIMIICLKIN,
	CLIENTEMAC1TXIFGDELAY,
	CLIENTEMAC1TXUNDERRUN,
	DCREMACABUS,
	DCREMACCLK,
	DCREMACDBUS,
	DCREMACENABLE,
	DCREMACREAD,
	DCREMACWRITE,
	HOSTADDR,
	HOSTCLK,
	HOSTEMAC1SEL,
	HOSTMIIMSEL,
	HOSTOPCODE,
	HOSTREQ,
	HOSTWRDATA,
	PHYEMAC0COL,
	PHYEMAC0CRS,
	PHYEMAC0GTXCLK,
	PHYEMAC0MCLKIN,
	PHYEMAC0MDIN,
	PHYEMAC0MIITXCLK,
	PHYEMAC0PHYAD,
	PHYEMAC0RXBUFERR,
	PHYEMAC0RXBUFSTATUS,
	PHYEMAC0RXCHARISCOMMA,
	PHYEMAC0RXCHARISK,
	PHYEMAC0RXCHECKINGCRC,
	PHYEMAC0RXCLK,
	PHYEMAC0RXCLKCORCNT,
	PHYEMAC0RXCOMMADET,
	PHYEMAC0RXD,
	PHYEMAC0RXDISPERR,
	PHYEMAC0RXDV,
	PHYEMAC0RXER,
	PHYEMAC0RXLOSSOFSYNC,
	PHYEMAC0RXNOTINTABLE,
	PHYEMAC0RXRUNDISP,
	PHYEMAC0SIGNALDET,
	PHYEMAC0TXBUFERR,
	PHYEMAC1COL,
	PHYEMAC1CRS,
	PHYEMAC1GTXCLK,
	PHYEMAC1MCLKIN,
	PHYEMAC1MDIN,
	PHYEMAC1MIITXCLK,
	PHYEMAC1PHYAD,
	PHYEMAC1RXBUFERR,
	PHYEMAC1RXBUFSTATUS,
	PHYEMAC1RXCHARISCOMMA,
	PHYEMAC1RXCHARISK,
	PHYEMAC1RXCHECKINGCRC,
	PHYEMAC1RXCLK,
	PHYEMAC1RXCLKCORCNT,
	PHYEMAC1RXCOMMADET,
	PHYEMAC1RXD,
	PHYEMAC1RXDISPERR,
	PHYEMAC1RXDV,
	PHYEMAC1RXER,
	PHYEMAC1RXLOSSOFSYNC,
	PHYEMAC1RXNOTINTABLE,
	PHYEMAC1RXRUNDISP,
	PHYEMAC1SIGNALDET,
	PHYEMAC1TXBUFERR,
	RESET,
	TIEEMAC0CONFIGVEC,
	TIEEMAC0UNICASTADDR,
	TIEEMAC1CONFIGVEC,
	TIEEMAC1UNICASTADDR
);


output DCRHOSTDONEIR;
output EMAC0CLIENTANINTERRUPT;
output EMAC0CLIENTRXBADFRAME;
output EMAC0CLIENTRXCLIENTCLKOUT;
output EMAC0CLIENTRXDVLD;
output EMAC0CLIENTRXDVLDMSW;
output EMAC0CLIENTRXDVREG6;
output EMAC0CLIENTRXFRAMEDROP;
output EMAC0CLIENTRXGOODFRAME;
output EMAC0CLIENTRXSTATSBYTEVLD;
output EMAC0CLIENTRXSTATSVLD;
output EMAC0CLIENTTXACK;
output EMAC0CLIENTTXCLIENTCLKOUT;
output EMAC0CLIENTTXCOLLISION;
output EMAC0CLIENTTXGMIIMIICLKOUT;
output EMAC0CLIENTTXRETRANSMIT;
output EMAC0CLIENTTXSTATS;
output EMAC0CLIENTTXSTATSBYTEVLD;
output EMAC0CLIENTTXSTATSVLD;
output EMAC0PHYENCOMMAALIGN;
output EMAC0PHYLOOPBACKMSB;
output EMAC0PHYMCLKOUT;
output EMAC0PHYMDOUT;
output EMAC0PHYMDTRI;
output EMAC0PHYMGTRXRESET;
output EMAC0PHYMGTTXRESET;
output EMAC0PHYPOWERDOWN;
output EMAC0PHYSYNCACQSTATUS;
output EMAC0PHYTXCHARDISPMODE;
output EMAC0PHYTXCHARDISPVAL;
output EMAC0PHYTXCHARISK;
output EMAC0PHYTXCLK;
output EMAC0PHYTXEN;
output EMAC0PHYTXER;
output EMAC1CLIENTANINTERRUPT;
output EMAC1CLIENTRXBADFRAME;
output EMAC1CLIENTRXCLIENTCLKOUT;
output EMAC1CLIENTRXDVLD;
output EMAC1CLIENTRXDVLDMSW;
output EMAC1CLIENTRXDVREG6;
output EMAC1CLIENTRXFRAMEDROP;
output EMAC1CLIENTRXGOODFRAME;
output EMAC1CLIENTRXSTATSBYTEVLD;
output EMAC1CLIENTRXSTATSVLD;
output EMAC1CLIENTTXACK;
output EMAC1CLIENTTXCLIENTCLKOUT;
output EMAC1CLIENTTXCOLLISION;
output EMAC1CLIENTTXGMIIMIICLKOUT;
output EMAC1CLIENTTXRETRANSMIT;
output EMAC1CLIENTTXSTATS;
output EMAC1CLIENTTXSTATSBYTEVLD;
output EMAC1CLIENTTXSTATSVLD;
output EMAC1PHYENCOMMAALIGN;
output EMAC1PHYLOOPBACKMSB;
output EMAC1PHYMCLKOUT;
output EMAC1PHYMDOUT;
output EMAC1PHYMDTRI;
output EMAC1PHYMGTRXRESET;
output EMAC1PHYMGTTXRESET;
output EMAC1PHYPOWERDOWN;
output EMAC1PHYSYNCACQSTATUS;
output EMAC1PHYTXCHARDISPMODE;
output EMAC1PHYTXCHARDISPVAL;
output EMAC1PHYTXCHARISK;
output EMAC1PHYTXCLK;
output EMAC1PHYTXEN;
output EMAC1PHYTXER;
output EMACDCRACK;
output HOSTMIIMRDY;
output [0:31] EMACDCRDBUS;
output [15:0] EMAC0CLIENTRXD;
output [15:0] EMAC1CLIENTRXD;
output [31:0] HOSTRDDATA;
output [6:0] EMAC0CLIENTRXSTATS;
output [6:0] EMAC1CLIENTRXSTATS;
output [7:0] EMAC0PHYTXD;
output [7:0] EMAC1PHYTXD;

input CLIENTEMAC0DCMLOCKED;
input CLIENTEMAC0PAUSEREQ;
input CLIENTEMAC0RXCLIENTCLKIN;
input CLIENTEMAC0TXCLIENTCLKIN;
input CLIENTEMAC0TXDVLD;
input CLIENTEMAC0TXDVLDMSW;
input CLIENTEMAC0TXFIRSTBYTE;
input CLIENTEMAC0TXGMIIMIICLKIN;
input CLIENTEMAC0TXUNDERRUN;
input CLIENTEMAC1DCMLOCKED;
input CLIENTEMAC1PAUSEREQ;
input CLIENTEMAC1RXCLIENTCLKIN;
input CLIENTEMAC1TXCLIENTCLKIN;
input CLIENTEMAC1TXDVLD;
input CLIENTEMAC1TXDVLDMSW;
input CLIENTEMAC1TXFIRSTBYTE;
input CLIENTEMAC1TXGMIIMIICLKIN;
input CLIENTEMAC1TXUNDERRUN;
input DCREMACCLK;
input DCREMACENABLE;
input DCREMACREAD;
input DCREMACWRITE;
input HOSTCLK;
input HOSTEMAC1SEL;
input HOSTMIIMSEL;
input HOSTREQ;
input PHYEMAC0COL;
input PHYEMAC0CRS;
input PHYEMAC0GTXCLK;
input PHYEMAC0MCLKIN;
input PHYEMAC0MDIN;
input PHYEMAC0MIITXCLK;
input PHYEMAC0RXBUFERR;
input PHYEMAC0RXCHARISCOMMA;
input PHYEMAC0RXCHARISK;
input PHYEMAC0RXCHECKINGCRC;
input PHYEMAC0RXCLK;
input PHYEMAC0RXCOMMADET;
input PHYEMAC0RXDISPERR;
input PHYEMAC0RXDV;
input PHYEMAC0RXER;
input PHYEMAC0RXNOTINTABLE;
input PHYEMAC0RXRUNDISP;
input PHYEMAC0SIGNALDET;
input PHYEMAC0TXBUFERR;
input PHYEMAC1COL;
input PHYEMAC1CRS;
input PHYEMAC1GTXCLK;
input PHYEMAC1MCLKIN;
input PHYEMAC1MDIN;
input PHYEMAC1MIITXCLK;
input PHYEMAC1RXBUFERR;
input PHYEMAC1RXCHARISCOMMA;
input PHYEMAC1RXCHARISK;
input PHYEMAC1RXCHECKINGCRC;
input PHYEMAC1RXCLK;
input PHYEMAC1RXCOMMADET;
input PHYEMAC1RXDISPERR;
input PHYEMAC1RXDV;
input PHYEMAC1RXER;
input PHYEMAC1RXNOTINTABLE;
input PHYEMAC1RXRUNDISP;
input PHYEMAC1SIGNALDET;
input PHYEMAC1TXBUFERR;
input RESET;
input [0:31] DCREMACDBUS;
input [15:0] CLIENTEMAC0PAUSEVAL;
input [15:0] CLIENTEMAC0TXD;
input [15:0] CLIENTEMAC1PAUSEVAL;
input [15:0] CLIENTEMAC1TXD;
input [1:0] HOSTOPCODE;
input [1:0] PHYEMAC0RXBUFSTATUS;
input [1:0] PHYEMAC0RXLOSSOFSYNC;
input [1:0] PHYEMAC1RXBUFSTATUS;
input [1:0] PHYEMAC1RXLOSSOFSYNC;
input [2:0] PHYEMAC0RXCLKCORCNT;
input [2:0] PHYEMAC1RXCLKCORCNT;
input [31:0] HOSTWRDATA;
input [47:0] TIEEMAC0UNICASTADDR;
input [47:0] TIEEMAC1UNICASTADDR;
input [4:0] PHYEMAC0PHYAD;
input [4:0] PHYEMAC1PHYAD;
input [79:0] TIEEMAC0CONFIGVEC;
input [79:0] TIEEMAC1CONFIGVEC;
input [7:0] CLIENTEMAC0TXIFGDELAY;
input [7:0] CLIENTEMAC1TXIFGDELAY;
input [7:0] PHYEMAC0RXD;
input [7:0] PHYEMAC1RXD;
input [8:9] DCREMACABUS;
input [9:0] HOSTADDR;

reg notifier;

// Delay wrapper for 16-bit client mode
wire PHYEMAC0MIITXCLK_delay;
wire [15:0] CLIENTEMAC0TXD_delay;
wire CLIENTEMAC0TXDVLD_delay;
wire CLIENTEMAC0TXDVLDMSW_delay;
wire PHYEMAC0MIITXCLK_skewed;
wire [15:0] CLIENTEMAC0TXD_client16_delay;
wire CLIENTEMAC0TXDVLD_client16_delay;
wire CLIENTEMAC0TXDVLDMSW_client16_delay;

wire PHYEMAC1MIITXCLK_delay;
wire [15:0] CLIENTEMAC1TXD_delay;
wire CLIENTEMAC1TXDVLD_delay;
wire CLIENTEMAC1TXDVLDMSW_delay;
wire PHYEMAC1MIITXCLK_skewed;
wire [15:0] CLIENTEMAC1TXD_client16_delay;
wire CLIENTEMAC1TXDVLD_client16_delay;
wire CLIENTEMAC1TXDVLDMSW_client16_delay;

localparam client_in_delay = 100;
localparam miitxclk_delay = 125; 

/*Delay EMAC# client input signals in 16-bit client mode*/
// EMAC0
assign #(client_in_delay) CLIENTEMAC0TXD_delay = CLIENTEMAC0TXD;
assign #(client_in_delay) CLIENTEMAC0TXDVLD_delay = CLIENTEMAC0TXDVLD;
assign #(client_in_delay) CLIENTEMAC0TXDVLDMSW_delay = CLIENTEMAC0TXDVLDMSW;

assign CLIENTEMAC0TXD_client16_delay       = (TIEEMAC0CONFIGVEC[66] == 1'b1) ? CLIENTEMAC0TXD_delay : CLIENTEMAC0TXD;        // CONFIGVEC[66] is 16-bit Tx client 
assign CLIENTEMAC0TXDVLD_client16_delay    = (TIEEMAC0CONFIGVEC[66] == 1'b1) ? CLIENTEMAC0TXDVLD_delay : CLIENTEMAC0TXDVLD;  
assign CLIENTEMAC0TXDVLDMSW_client16_delay = (TIEEMAC0CONFIGVEC[66] == 1'b1) ? CLIENTEMAC0TXDVLDMSW_delay : CLIENTEMAC0TXDVLDMSW;  

// EMAC1
assign #(client_in_delay) CLIENTEMAC1TXD_delay = CLIENTEMAC1TXD;
assign #(client_in_delay) CLIENTEMAC1TXDVLD_delay = CLIENTEMAC1TXDVLD;
assign #(client_in_delay) CLIENTEMAC1TXDVLDMSW_delay = CLIENTEMAC1TXDVLDMSW;

assign CLIENTEMAC1TXD_client16_delay       = (TIEEMAC1CONFIGVEC[66] == 1'b1) ? CLIENTEMAC1TXD_delay : CLIENTEMAC1TXD;        // CONFIGVEC[66] is 16-bit Tx client 
assign CLIENTEMAC1TXDVLD_client16_delay    = (TIEEMAC1CONFIGVEC[66] == 1'b1) ? CLIENTEMAC1TXDVLD_delay : CLIENTEMAC1TXDVLD;  
assign CLIENTEMAC1TXDVLDMSW_client16_delay = (TIEEMAC1CONFIGVEC[66] == 1'b1) ? CLIENTEMAC1TXDVLDMSW_delay : CLIENTEMAC1TXDVLDMSW;  

/*Skew 125 MHz clock EMAC#MIITXCLK against 250 MHz clock in 16-bit client mode*/
assign #(miitxclk_delay) PHYEMAC0MIITXCLK_delay = PHYEMAC0MIITXCLK;
assign PHYEMAC0MIITXCLK_skewed = (TIEEMAC0CONFIGVEC[66] == 1'b1) ? PHYEMAC0MIITXCLK_delay : PHYEMAC0MIITXCLK; // In TXCLIENT16 mode

assign #(miitxclk_delay) PHYEMAC1MIITXCLK_delay = PHYEMAC1MIITXCLK;
assign PHYEMAC1MIITXCLK_skewed = (TIEEMAC1CONFIGVEC[66] == 1'b1) ? PHYEMAC1MIITXCLK_delay : PHYEMAC1MIITXCLK; // In TXCLIENT16 mode 

EMAC_SWIFT emac_swift_1 (
	.CLIENTEMAC0DCMLOCKED (CLIENTEMAC0DCMLOCKED),
	.CLIENTEMAC0PAUSEREQ (CLIENTEMAC0PAUSEREQ),
	.CLIENTEMAC0PAUSEVAL (CLIENTEMAC0PAUSEVAL),
	.CLIENTEMAC0RXCLIENTCLKIN (CLIENTEMAC0RXCLIENTCLKIN),
	.CLIENTEMAC0TXCLIENTCLKIN (CLIENTEMAC0TXCLIENTCLKIN),
	.CLIENTEMAC0TXD (CLIENTEMAC0TXD_client16_delay),
	.CLIENTEMAC0TXDVLD (CLIENTEMAC0TXDVLD_client16_delay),
	.CLIENTEMAC0TXDVLDMSW (CLIENTEMAC0TXDVLDMSW_client16_delay),
	.CLIENTEMAC0TXFIRSTBYTE (CLIENTEMAC0TXFIRSTBYTE),
	.CLIENTEMAC0TXGMIIMIICLKIN (CLIENTEMAC0TXGMIIMIICLKIN),
	.CLIENTEMAC0TXIFGDELAY (CLIENTEMAC0TXIFGDELAY),
	.CLIENTEMAC0TXUNDERRUN (CLIENTEMAC0TXUNDERRUN),
	.CLIENTEMAC1DCMLOCKED (CLIENTEMAC1DCMLOCKED),
	.CLIENTEMAC1PAUSEREQ (CLIENTEMAC1PAUSEREQ),
	.CLIENTEMAC1PAUSEVAL (CLIENTEMAC1PAUSEVAL),
	.CLIENTEMAC1RXCLIENTCLKIN (CLIENTEMAC1RXCLIENTCLKIN),
	.CLIENTEMAC1TXCLIENTCLKIN (CLIENTEMAC1TXCLIENTCLKIN),
	.CLIENTEMAC1TXD (CLIENTEMAC1TXD_client16_delay),
	.CLIENTEMAC1TXDVLD (CLIENTEMAC1TXDVLD_client16_delay),
	.CLIENTEMAC1TXDVLDMSW (CLIENTEMAC1TXDVLDMSW_client16_delay),
	.CLIENTEMAC1TXFIRSTBYTE (CLIENTEMAC1TXFIRSTBYTE),
	.CLIENTEMAC1TXGMIIMIICLKIN (CLIENTEMAC1TXGMIIMIICLKIN),
	.CLIENTEMAC1TXIFGDELAY (CLIENTEMAC1TXIFGDELAY),
	.CLIENTEMAC1TXUNDERRUN (CLIENTEMAC1TXUNDERRUN),
	.DCREMACABUS (DCREMACABUS),
	.DCREMACCLK (DCREMACCLK),
	.DCREMACDBUS (DCREMACDBUS),
	.DCREMACENABLE (DCREMACENABLE),
	.DCREMACREAD (DCREMACREAD),
	.DCREMACWRITE (DCREMACWRITE),
	.DCRHOSTDONEIR (DCRHOSTDONEIR),
	.EMAC0CLIENTANINTERRUPT (EMAC0CLIENTANINTERRUPT),
	.EMAC0CLIENTRXBADFRAME (EMAC0CLIENTRXBADFRAME),
	.EMAC0CLIENTRXCLIENTCLKOUT (EMAC0CLIENTRXCLIENTCLKOUT),
	.EMAC0CLIENTRXD (EMAC0CLIENTRXD),
	.EMAC0CLIENTRXDVLD (EMAC0CLIENTRXDVLD),
	.EMAC0CLIENTRXDVLDMSW (EMAC0CLIENTRXDVLDMSW),
	.EMAC0CLIENTRXDVREG6 (EMAC0CLIENTRXDVREG6),
	.EMAC0CLIENTRXFRAMEDROP (EMAC0CLIENTRXFRAMEDROP),
	.EMAC0CLIENTRXGOODFRAME (EMAC0CLIENTRXGOODFRAME),
	.EMAC0CLIENTRXSTATS (EMAC0CLIENTRXSTATS),
	.EMAC0CLIENTRXSTATSBYTEVLD (EMAC0CLIENTRXSTATSBYTEVLD),
	.EMAC0CLIENTRXSTATSVLD (EMAC0CLIENTRXSTATSVLD),
	.EMAC0CLIENTTXACK (EMAC0CLIENTTXACK),
	.EMAC0CLIENTTXCLIENTCLKOUT (EMAC0CLIENTTXCLIENTCLKOUT),
	.EMAC0CLIENTTXCOLLISION (EMAC0CLIENTTXCOLLISION),
	.EMAC0CLIENTTXGMIIMIICLKOUT (EMAC0CLIENTTXGMIIMIICLKOUT),
	.EMAC0CLIENTTXRETRANSMIT (EMAC0CLIENTTXRETRANSMIT),
	.EMAC0CLIENTTXSTATS (EMAC0CLIENTTXSTATS),
	.EMAC0CLIENTTXSTATSBYTEVLD (EMAC0CLIENTTXSTATSBYTEVLD),
	.EMAC0CLIENTTXSTATSVLD (EMAC0CLIENTTXSTATSVLD),
	.EMAC0PHYENCOMMAALIGN (EMAC0PHYENCOMMAALIGN),
	.EMAC0PHYLOOPBACKMSB (EMAC0PHYLOOPBACKMSB),
	.EMAC0PHYMCLKOUT (EMAC0PHYMCLKOUT),
	.EMAC0PHYMDOUT (EMAC0PHYMDOUT),
	.EMAC0PHYMDTRI (EMAC0PHYMDTRI),
	.EMAC0PHYMGTRXRESET (EMAC0PHYMGTRXRESET),
	.EMAC0PHYMGTTXRESET (EMAC0PHYMGTTXRESET),
	.EMAC0PHYPOWERDOWN (EMAC0PHYPOWERDOWN),
	.EMAC0PHYSYNCACQSTATUS (EMAC0PHYSYNCACQSTATUS),
	.EMAC0PHYTXCHARDISPMODE (EMAC0PHYTXCHARDISPMODE),
	.EMAC0PHYTXCHARDISPVAL (EMAC0PHYTXCHARDISPVAL),
	.EMAC0PHYTXCHARISK (EMAC0PHYTXCHARISK),
	.EMAC0PHYTXCLK (EMAC0PHYTXCLK),
	.EMAC0PHYTXD (EMAC0PHYTXD),
	.EMAC0PHYTXEN (EMAC0PHYTXEN),
	.EMAC0PHYTXER (EMAC0PHYTXER),
	.EMAC1CLIENTANINTERRUPT (EMAC1CLIENTANINTERRUPT),
	.EMAC1CLIENTRXBADFRAME (EMAC1CLIENTRXBADFRAME),
	.EMAC1CLIENTRXCLIENTCLKOUT (EMAC1CLIENTRXCLIENTCLKOUT),
	.EMAC1CLIENTRXD (EMAC1CLIENTRXD),
	.EMAC1CLIENTRXDVLD (EMAC1CLIENTRXDVLD),
	.EMAC1CLIENTRXDVLDMSW (EMAC1CLIENTRXDVLDMSW),
	.EMAC1CLIENTRXDVREG6 (EMAC1CLIENTRXDVREG6),
	.EMAC1CLIENTRXFRAMEDROP (EMAC1CLIENTRXFRAMEDROP),
	.EMAC1CLIENTRXGOODFRAME (EMAC1CLIENTRXGOODFRAME),
	.EMAC1CLIENTRXSTATS (EMAC1CLIENTRXSTATS),
	.EMAC1CLIENTRXSTATSBYTEVLD (EMAC1CLIENTRXSTATSBYTEVLD),
	.EMAC1CLIENTRXSTATSVLD (EMAC1CLIENTRXSTATSVLD),
	.EMAC1CLIENTTXACK (EMAC1CLIENTTXACK),
	.EMAC1CLIENTTXCLIENTCLKOUT (EMAC1CLIENTTXCLIENTCLKOUT),
	.EMAC1CLIENTTXCOLLISION (EMAC1CLIENTTXCOLLISION),
	.EMAC1CLIENTTXGMIIMIICLKOUT (EMAC1CLIENTTXGMIIMIICLKOUT),
	.EMAC1CLIENTTXRETRANSMIT (EMAC1CLIENTTXRETRANSMIT),
	.EMAC1CLIENTTXSTATS (EMAC1CLIENTTXSTATS),
	.EMAC1CLIENTTXSTATSBYTEVLD (EMAC1CLIENTTXSTATSBYTEVLD),
	.EMAC1CLIENTTXSTATSVLD (EMAC1CLIENTTXSTATSVLD),
	.EMAC1PHYENCOMMAALIGN (EMAC1PHYENCOMMAALIGN),
	.EMAC1PHYLOOPBACKMSB (EMAC1PHYLOOPBACKMSB),
	.EMAC1PHYMCLKOUT (EMAC1PHYMCLKOUT),
	.EMAC1PHYMDOUT (EMAC1PHYMDOUT),
	.EMAC1PHYMDTRI (EMAC1PHYMDTRI),
	.EMAC1PHYMGTRXRESET (EMAC1PHYMGTRXRESET),
	.EMAC1PHYMGTTXRESET (EMAC1PHYMGTTXRESET),
	.EMAC1PHYPOWERDOWN (EMAC1PHYPOWERDOWN),
	.EMAC1PHYSYNCACQSTATUS (EMAC1PHYSYNCACQSTATUS),
	.EMAC1PHYTXCHARDISPMODE (EMAC1PHYTXCHARDISPMODE),
	.EMAC1PHYTXCHARDISPVAL (EMAC1PHYTXCHARDISPVAL),
	.EMAC1PHYTXCHARISK (EMAC1PHYTXCHARISK),
	.EMAC1PHYTXCLK (EMAC1PHYTXCLK),
	.EMAC1PHYTXD (EMAC1PHYTXD),
	.EMAC1PHYTXEN (EMAC1PHYTXEN),
	.EMAC1PHYTXER (EMAC1PHYTXER),
	.EMACDCRACK (EMACDCRACK),
	.EMACDCRDBUS (EMACDCRDBUS),
	.HOSTADDR (HOSTADDR),
	.HOSTCLK (HOSTCLK),
	.HOSTEMAC1SEL (HOSTEMAC1SEL),
	.HOSTMIIMRDY (HOSTMIIMRDY),
	.HOSTMIIMSEL (HOSTMIIMSEL),
	.HOSTOPCODE (HOSTOPCODE),
	.HOSTRDDATA (HOSTRDDATA),
	.HOSTREQ (HOSTREQ),
	.HOSTWRDATA (HOSTWRDATA),
	.PHYEMAC0COL (PHYEMAC0COL),
	.PHYEMAC0CRS (PHYEMAC0CRS),
	.PHYEMAC0GTXCLK (PHYEMAC0GTXCLK),
	.PHYEMAC0MCLKIN (PHYEMAC0MCLKIN),
	.PHYEMAC0MDIN (PHYEMAC0MDIN),
	.PHYEMAC0MIITXCLK (PHYEMAC0MIITXCLK_skewed),
	.PHYEMAC0PHYAD (PHYEMAC0PHYAD),
	.PHYEMAC0RXBUFERR (PHYEMAC0RXBUFERR),
	.PHYEMAC0RXBUFSTATUS (PHYEMAC0RXBUFSTATUS),
	.PHYEMAC0RXCHARISCOMMA (PHYEMAC0RXCHARISCOMMA),
	.PHYEMAC0RXCHARISK (PHYEMAC0RXCHARISK),
	.PHYEMAC0RXCHECKINGCRC (PHYEMAC0RXCHECKINGCRC),
	.PHYEMAC0RXCLK (PHYEMAC0RXCLK),
	.PHYEMAC0RXCLKCORCNT (PHYEMAC0RXCLKCORCNT),
	.PHYEMAC0RXCOMMADET (PHYEMAC0RXCOMMADET),
	.PHYEMAC0RXD (PHYEMAC0RXD),
	.PHYEMAC0RXDISPERR (PHYEMAC0RXDISPERR),
	.PHYEMAC0RXDV (PHYEMAC0RXDV),
	.PHYEMAC0RXER (PHYEMAC0RXER),
	.PHYEMAC0RXLOSSOFSYNC (PHYEMAC0RXLOSSOFSYNC),
	.PHYEMAC0RXNOTINTABLE (PHYEMAC0RXNOTINTABLE),
	.PHYEMAC0RXRUNDISP (PHYEMAC0RXRUNDISP),
	.PHYEMAC0SIGNALDET (PHYEMAC0SIGNALDET),
	.PHYEMAC0TXBUFERR (PHYEMAC0TXBUFERR),
	.PHYEMAC1COL (PHYEMAC1COL),
	.PHYEMAC1CRS (PHYEMAC1CRS),
	.PHYEMAC1GTXCLK (PHYEMAC1GTXCLK),
	.PHYEMAC1MCLKIN (PHYEMAC1MCLKIN),
	.PHYEMAC1MDIN (PHYEMAC1MDIN),
	.PHYEMAC1MIITXCLK (PHYEMAC1MIITXCLK_skewed),
	.PHYEMAC1PHYAD (PHYEMAC1PHYAD),
	.PHYEMAC1RXBUFERR (PHYEMAC1RXBUFERR),
	.PHYEMAC1RXBUFSTATUS (PHYEMAC1RXBUFSTATUS),
	.PHYEMAC1RXCHARISCOMMA (PHYEMAC1RXCHARISCOMMA),
	.PHYEMAC1RXCHARISK (PHYEMAC1RXCHARISK),
	.PHYEMAC1RXCHECKINGCRC (PHYEMAC1RXCHECKINGCRC),
	.PHYEMAC1RXCLK (PHYEMAC1RXCLK),
	.PHYEMAC1RXCLKCORCNT (PHYEMAC1RXCLKCORCNT),
	.PHYEMAC1RXCOMMADET (PHYEMAC1RXCOMMADET),
	.PHYEMAC1RXD (PHYEMAC1RXD),
	.PHYEMAC1RXDISPERR (PHYEMAC1RXDISPERR),
	.PHYEMAC1RXDV (PHYEMAC1RXDV),
	.PHYEMAC1RXER (PHYEMAC1RXER),
	.PHYEMAC1RXLOSSOFSYNC (PHYEMAC1RXLOSSOFSYNC),
	.PHYEMAC1RXNOTINTABLE (PHYEMAC1RXNOTINTABLE),
	.PHYEMAC1RXRUNDISP (PHYEMAC1RXRUNDISP),
	.PHYEMAC1SIGNALDET (PHYEMAC1SIGNALDET),
	.PHYEMAC1TXBUFERR (PHYEMAC1TXBUFERR),
	.RESET (RESET),
	.TIEEMAC0CONFIGVEC (TIEEMAC0CONFIGVEC),
	.TIEEMAC0UNICASTADDR (TIEEMAC0UNICASTADDR),
	.TIEEMAC1CONFIGVEC (TIEEMAC1CONFIGVEC),
	.TIEEMAC1UNICASTADDR (TIEEMAC1UNICASTADDR)
);

specify
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXBADFRAME) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXD) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXDVLD) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXDVLDMSW) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXDVREG6) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXFRAMEDROP) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXGOODFRAME) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXSTATS) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXSTATSBYTEVLD) = (100, 100);
	(CLIENTEMAC0RXCLIENTCLKIN => EMAC0CLIENTRXSTATSVLD) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXACK) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXCOLLISION) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXRETRANSMIT) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXSTATS) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXSTATSBYTEVLD) = (100, 100);
	(CLIENTEMAC0TXCLIENTCLKIN => EMAC0CLIENTTXSTATSVLD) = (100, 100);
	(CLIENTEMAC0TXGMIIMIICLKIN => EMAC0PHYTXD) = (100, 100);
	(CLIENTEMAC0TXGMIIMIICLKIN => EMAC0PHYTXEN) = (100, 100);
	(CLIENTEMAC0TXGMIIMIICLKIN => EMAC0PHYTXER) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXBADFRAME) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXD) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXDVLD) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXDVLDMSW) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXDVREG6) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXFRAMEDROP) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXGOODFRAME) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXSTATS) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXSTATSBYTEVLD) = (100, 100);
	(CLIENTEMAC1RXCLIENTCLKIN => EMAC1CLIENTRXSTATSVLD) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXACK) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXCOLLISION) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXRETRANSMIT) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXSTATS) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXSTATSBYTEVLD) = (100, 100);
	(CLIENTEMAC1TXCLIENTCLKIN => EMAC1CLIENTTXSTATSVLD) = (100, 100);
	(CLIENTEMAC1TXGMIIMIICLKIN => EMAC1PHYTXD) = (100, 100);
	(CLIENTEMAC1TXGMIIMIICLKIN => EMAC1PHYTXEN) = (100, 100);
	(CLIENTEMAC1TXGMIIMIICLKIN => EMAC1PHYTXER) = (100, 100);
	(HOSTCLK => EMAC0PHYMCLKOUT) = (100, 100);
	(HOSTCLK => EMAC0PHYMDOUT) = (100, 100);
	(HOSTCLK => EMAC0PHYMDTRI) = (100, 100);
	(HOSTCLK => EMAC1PHYMCLKOUT) = (100, 100);
	(HOSTCLK => EMAC1PHYMDOUT) = (100, 100);
	(HOSTCLK => EMAC1PHYMDTRI) = (100, 100);
	(HOSTCLK => HOSTMIIMRDY) = (100, 100);
	(HOSTCLK => HOSTRDDATA) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0CLIENTANINTERRUPT) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0CLIENTRXCLIENTCLKOUT) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0CLIENTTXCLIENTCLKOUT) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0CLIENTTXGMIIMIICLKOUT) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYENCOMMAALIGN) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYLOOPBACKMSB) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYMGTRXRESET) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYMGTTXRESET) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYPOWERDOWN) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYSYNCACQSTATUS) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYTXCHARDISPMODE) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYTXCHARDISPVAL) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYTXCHARISK) = (100, 100);
	(PHYEMAC0GTXCLK => EMAC0PHYTXCLK) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1CLIENTANINTERRUPT) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1CLIENTRXCLIENTCLKOUT) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1CLIENTTXCLIENTCLKOUT) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1CLIENTTXGMIIMIICLKOUT) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYENCOMMAALIGN) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYLOOPBACKMSB) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYMGTRXRESET) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYMGTTXRESET) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYPOWERDOWN) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYSYNCACQSTATUS) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYTXCHARDISPMODE) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYTXCHARDISPVAL) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYTXCHARISK) = (100, 100);
	(PHYEMAC1GTXCLK => EMAC1PHYTXCLK) = (100, 100);
	specparam PATHPULSE$ = 0;
endspecify
endmodule
