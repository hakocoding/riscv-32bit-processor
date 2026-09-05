module register_tb();
    logic [4:0] a1, a2, a3;
    logic [31:0] wd;
    logic clk, we;
    logic [31:0] rd1, rd2;

    register dut(
        .a1(a1), .a2(a2), .a3(a3),
        .wd(wd), .clk(clk), .we(we),
        .rd1(rd1), .rd2(rd2)
    );

    always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, register_tb);

        // Test 1: register 5'e yaz, geri oku
        we = 1;
        a3 = 5'd5;
        wd = 32'hDEADBEEF;
        a1 = 5'd5;
        a2 = 5'd0;
        @(posedge clk);
        #1;
        if (rd1 !== 32'hDEADBEEF)
            $display("TEST 1 BASARISIZ: rd1 = %h, beklenen DEADBEEF", rd1);
        else
            $display("TEST 1 GECTI: rd1 = %h", rd1);

        // Test 2: x0'a yazmaya calis, hala 0 mi
        we = 1;
        a3 = 5'd0;
        wd = 32'hFFFFFFFF;
        a1 = 5'd0;
        @(posedge clk);
        #1;
        if (rd1 !== 32'h0)
            $display("TEST 2 BASARISIZ: x0 = %h, beklenen 0", rd1);
        else
            $display("TEST 2 GECTI: x0 hala 0");

        // Test 3: iki farkli register'a yaz, ikisini ayni anda oku
        we = 1; a3 = 5'd10; wd = 32'h11111111;
        @(posedge clk); #1;
        we = 1; a3 = 5'd20; wd = 32'h22222222;
        @(posedge clk); #1;

        we = 0;
        a1 = 5'd10;
        a2 = 5'd20;
        #1;
        if (rd1 !== 32'h11111111 || rd2 !== 32'h22222222)
            $display("TEST 3 BASARISIZ: rd1=%h rd2=%h", rd1, rd2);
        else
            $display("TEST 3 GECTI: rd1=%h rd2=%h", rd1, rd2);

        $finish;
    end
endmodule