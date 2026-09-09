module tb_processor();

    logic clk;
    logic rst;

    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    processor dut(
        .clk(clk),
        .reset(rst)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_processor);

        rst = 1;
        @(posedge clk);
        #1;
        rst = 0;

        // 9 instruction var, her biri 1 clock cycle - bol pay birakalim
        #100;

        if (dut.dp.a_register.registerFile[1] !== 32'd5)
            $display("BASARISIZ: x1 = %0d, beklenen 5", dut.dp.a_register.registerFile[1]);
        else
            $display("GECTI: x1 = %0d", dut.dp.a_register.registerFile[1]);

        if (dut.dp.a_register.registerFile[2] !== 32'd3)
            $display("BASARISIZ: x2 = %0d, beklenen 3", dut.dp.a_register.registerFile[2]);
        else
            $display("GECTI: x2 = %0d", dut.dp.a_register.registerFile[2]);

        if (dut.dp.a_register.registerFile[3] !== 32'd8)
            $display("BASARISIZ: x3 = %0d, beklenen 8 (add)", dut.dp.a_register.registerFile[3]);
        else
            $display("GECTI: x3 = %0d (add)", dut.dp.a_register.registerFile[3]);

        if (dut.dp.a_register.registerFile[4] !== 32'd2)
            $display("BASARISIZ: x4 = %0d, beklenen 2 (sub)", dut.dp.a_register.registerFile[4]);
        else
            $display("GECTI: x4 = %0d (sub)", dut.dp.a_register.registerFile[4]);

        if (dut.dp.a_register.registerFile[5] !== 32'd8)
            $display("BASARISIZ: x5 = %0d, beklenen 8 (lw geri okuma)", dut.dp.a_register.registerFile[5]);
        else
            $display("GECTI: x5 = %0d (sw+lw)", dut.dp.a_register.registerFile[5]);

        if (dut.dp.a_register.registerFile[6] !== 32'd0)
            $display("BASARISIZ: x6 = %0d, beklenen 0 (beq atlamasi calismadi!)", dut.dp.a_register.registerFile[6]);
        else
            $display("GECTI: x6 = 0 (beq dogru atladi)");

        if (dut.dp.a_register.registerFile[7] !== 32'd42)
            $display("BASARISIZ: x7 = %0d, beklenen 42 (beq sonrasi devam)", dut.dp.a_register.registerFile[7]);
        else
            $display("GECTI: x7 = %0d", dut.dp.a_register.registerFile[7]);

        $finish;
    end

endmodule