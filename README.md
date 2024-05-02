# Field Programmable Gate Array

There are two main components of the FPGAs: the CLB (configurable logic block) and the routing channel/interconnect.

The configurable logic block is essentially the combinational block of the FPGA, but instead of having adders and multipliers, we have a Look-Up Table (LUT) or a ROM, where the outputs of a particular combinational operation are pre-computed.

Everything that goes into the CLB, and comes out of it has to do this through the routing channel. In a normal FPGA, actual switches are used, however, in this repository, I have used multiplexers instead. 

To add the two 8-bit numbers, I first give the numbers to the routing channel where they are sliced into 2-bit numbers and sent to the correct CLB. This is done using multiplexers with the control signal coming from a ``bit file''. A CLB then sends its carry-out and the sum of the 2-bit slices to the routing channel, after which the routing channel sends the carry-out of the first CLB as the carry-in to the next CLB. This is also done using the multiplexers whose control signal comes from the bit file. In the end, all the sums are concatenated to get the 8-bit output. This operation can be done within one cycle as well, and at most in 4 clock cycles, depending on the input signals and carry generated, because there is a flip flop at the output of every CLB.
