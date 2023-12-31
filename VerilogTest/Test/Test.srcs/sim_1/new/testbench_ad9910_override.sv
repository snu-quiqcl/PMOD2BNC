`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/08/20 18:37:02
// Design Name: 
// Module Name: testbench_ad9910_override
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench_ad9910_override;


logic clk;
logic reset;
logic auto_start;
logic flush_rto_fifo;
logic write_rto_fifo;
logic [127:0] rto_fifo_din;
wire [63:0] counter;
logic flush_rti_fifo;
logic read_rti_fifo;
logic gpo_override_en;
logic gpo_selected_en;
logic [63:0] gpo_override_value;
wire [127:0] rto_timestamp_error_data;
wire [127:0] rto_overflow_error_data;
wire rto_timestamp_error;
wire rto_overflow_error;
wire rto_fifo_full;
wire rto_fifo_empty;
wire [127:0] rti_out;
wire [127:0] rti_overflow_error_data;
wire rti_overflow_error;
wire rti_underflow_error;
wire rti_fifo_full;
wire rti_fifo_empty;
wire busy;
wire [127:0] gpo_error_data;
wire gpo_overrided;
wire gpo_busy_error;
wire gpi_data_ready;
wire [127:0] gpi_out;
wire io;
wire sck;
wire [1:0] cs;
wire io_update1;
wire io_update2;
wire [2:0] profile1;
wire [2:0] profile2;
wire [18:0] parallel_out;
logic io_val;

assign io = (~AD9910_driver_0.slave_en_wire)? 1'bz:io_val;

AD9910_driver
#(
    .NUM_CS(2)
)
AD9910_driver_0
(
    .clk(clk),
    .reset(reset),
    .auto_start(auto_start),
    .flush_rto_fifo(flush_rto_fifo),
    .write_rto_fifo(write_rto_fifo),
    .rto_fifo_din(rto_fifo_din),
    .counter(counter),
    .flush_rti_fifo(flush_rti_fifo),
    .read_rti_fifo(read_rti_fifo),
    .gpo_override_en(gpo_override_en),
    .gpo_selected_en(gpo_selected_en),
    .gpo_override_value(gpo_override_value),
    .rto_timestamp_error_data(rto_timestamp_error_data),
    .rto_overflow_error_data(rto_overflow_error_data),
    .rto_timestamp_error(rto_timestamp_error),
    .rto_overflow_error(rto_overflow_error),
    .rto_fifo_full(rto_fifo_full),
    .rto_fifo_empty(rto_fifo_empty),
    .rti_out(rti_out),
    .rti_overflow_error_data(rti_overflow_error_data),
    .rti_overflow_error(rti_overflow_error),
    .rti_underflow_error(rti_underflow_error),
    .rti_fifo_full(rti_fifo_full),
    .rti_fifo_empty(rti_fifo_empty),
    .busy(busy),
    .gpo_error_data(gpo_error_data),
    .gpo_overrided(gpo_overrided),
    .gpo_busy_error(gpo_busy_error),
    .gpi_data_ready(gpi_data_ready),
    .gpi_out(gpi_out),
    .io(io),
    .sck(sck),
    .cs(cs),
    .io_update1(io_update1),
    .io_update2(io_update2),
    .profile1(profile1),
    .profile2(profile2),
    .parallel_out(parallel_out)
    );

logic start;
logic counter_offset;
logic offset_en;

timestamp_counter timestamp_counter_0(
    .clk(clk),
    .reset(reset),
    .start(start),
    .counter_offset(counter_offset),
    .offset_en(offset_en),
    .counter(counter)
    );

always begin
    #5
    clk = ~clk;
end

initial begin
    clk = 1'b0;
    reset = 1'b0;
    auto_start = 1'b0;
    flush_rto_fifo = 1'b0;
    write_rto_fifo = 1'b0;
    rto_fifo_din[127:0] = 128'h0;
    flush_rti_fifo = 1'b0;
    read_rti_fifo = 1'b0;
    gpo_override_en = 1'b0;
    gpo_selected_en = 1'b0;
    gpo_override_value[63:0] = 64'h0;
    start = 1'b0;
    counter_offset = 64'h0;
    offset_en = 1'b0;
    
    #10
    reset = 1'b1;
    #10
    reset = 1'b0;
    
    #100
    gpo_override_value = 64'd1 << 44 | 64'd1 << 31 | 64'd0 << 29 |  64'd1 << 16 |  64'd31 << 11 | 64'd0 << 8 | 64'd8;
    gpo_override_en  = 1'b1;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #100
    gpo_override_value = 64'd0 << 44 | 64'b10111111111111110000001111001101;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #3000
    gpo_override_value = 64'd1 << 44 | 64'd1 << 31 | 64'd1 << 29 |  64'd1 << 16 |  64'd7 << 11 | 64'd1 << 8 | 64'd8;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #100
    gpo_override_value = 64'd0 << 44 | 64'b00110111111111110000001111001101;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #3000
    gpo_override_value = 64'd1 << 44 | 64'd0 << 31 | 64'd1 << 30 | 64'd0 << 29 |  64'd1 << 16 |  64'd7 << 11 | 64'd1 << 8 | 64'd8;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #100
    gpo_override_value = 64'd0 << 44 | 64'b0;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #3000
    gpo_override_value = 64'd1 << 44 | 64'd0 << 31 | 64'd1 << 30 | 64'd1 << 29 |  64'd1 << 16 |  64'd7 << 11 | 64'd0 << 8 | 64'd8;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #100
    gpo_override_value = 64'd0 << 44 | 64'b0;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #3000
    gpo_override_value = 64'd2 << 44 | 64'b11;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #10
    gpo_override_value = 64'd2 << 44 | 64'b10;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #10
    gpo_override_value = 64'd2 << 44 | 64'b00;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #10
    gpo_override_value = 64'd3 << 44 | 64'b001101;
    gpo_selected_en = 1'b1;
    #10
    gpo_override_value = 64'd3 << 44 | 64'b100001;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #10
    gpo_override_value = 64'd4 << 44 | 64'b1111011111011111011;
    gpo_selected_en = 1'b1;
    #10
    gpo_override_value = 64'd4 << 44 | 64'b0010010010010010011;
    gpo_selected_en = 1'b1;
    #10
    gpo_selected_en = 1'b0;
    
    #10
    gpo_selected_en = 1'b0;
    
end

initial begin
    #7000
    read_rti_fifo = 1'b1;
    #10
    read_rti_fifo = 1'b0;
    #10
    read_rti_fifo = 1'b1;
    #10
    read_rti_fifo = 1'b0;
    #10
    read_rti_fifo = 1'b1;
    #10
    read_rti_fifo = 1'b0;
    #6000
    reset = 1'b1;
    #10
    reset = 1'b0;
end

initial begin
    io_val = 1'b1;
end

endmodule
