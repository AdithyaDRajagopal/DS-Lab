entity decoder_tb is
end decoder_tb;

architecture behav of decoder_tb is
	component decoder
		port (i2, i1, i0 : in bit; o0, o1, o2, o3, o4, o5, o6, o7 : out bit);
	end component;

	for decoder_0: decoder use entity work.decoder;
	signal i2, i1, i0, o0, o1, o2, o3, o4, o5, o6, o7 : bit;
	begin
	decoder_0: decoder port map (i2 => i2, i1 => i1, i0 => i0, o0 => o0, o1 => o1, o2 => o2, o3 => o3, o4 => o4, o5 => o5, o6 => o6, o7 => o7);
	process
		type pattern_type is record
			i2, i1, i0 : bit;
			o0, o1, o2, o3, o4, o5, o6, o7 : bit;
		end record;
		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns : pattern_array :=
					(('0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
					('0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0'),
					('0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0'),
					('0', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0'),
					('1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
					('1', '0', '1', '0', '0', '0', '0', '0', '1', '0', '0'),
					('1', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0'),
					('1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '1'));
		begin
			for i in patterns'range loop
				i2 <= patterns(i).i2;
				i1 <= patterns(i).i1;
				i0 <= patterns(i).i0;
				wait for 1 ns;
				assert o0 = patterns(i).o0;
				assert o1 = patterns(i).o1;
				assert o2 = patterns(i).o2;
				assert o3 = patterns(i).o3;
				assert o4 = patterns(i).o4;
				assert o5 = patterns(i).o5;
				assert o6 = patterns(i).o6;
				assert o7 = patterns(i).o7;
			end loop;
		assert false report "end of test" severity note;
		wait;
	end process;
end behav;

