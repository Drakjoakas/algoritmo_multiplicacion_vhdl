-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/17/2022 01:17:37"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          practica5
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY practica5_vhd_vec_tst IS
END practica5_vhd_vec_tst;
ARCHITECTURE practica5_arch OF practica5_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL ClrCounter : STD_LOGIC;
SIGNAL FC : STD_LOGIC;
SIGNAL IncCounter : STD_LOGIC;
COMPONENT practica5
	PORT (
	clk : IN STD_LOGIC;
	ClrCounter : IN STD_LOGIC;
	FC : OUT STD_LOGIC;
	IncCounter : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : practica5
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	ClrCounter => ClrCounter,
	FC => FC,
	IncCounter => IncCounter
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 25000 ps;
	clk <= '1';
	WAIT FOR 25000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- ClrCounter
t_prcs_ClrCounter: PROCESS
BEGIN
	ClrCounter <= '0';
	WAIT FOR 520000 ps;
	ClrCounter <= '1';
	WAIT FOR 40000 ps;
	ClrCounter <= '0';
WAIT;
END PROCESS t_prcs_ClrCounter;

-- IncCounter
t_prcs_IncCounter: PROCESS
BEGIN
	IncCounter <= '1';
WAIT;
END PROCESS t_prcs_IncCounter;
END practica5_arch;
