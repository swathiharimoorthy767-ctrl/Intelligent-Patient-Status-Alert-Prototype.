module patient_status_alert (
    input  [7:0] sensor_value,
    output reg normal_led,
    output reg warning_led,
    output reg critical_led,
    output reg alarm
);

always @(*) begin

    // Default OFF
    normal_led   = 1'b0;
    warning_led  = 1'b0;
    critical_led = 1'b0;
    alarm        = 1'b0;

    // 0 - 49 : NORMAL
    if (sensor_value <= 8'd49) begin
        normal_led = 1'b1;
    end

    // 50 - 79 : WARNING
    else if (sensor_value <= 8'd79) begin
        warning_led = 1'b1;
    end

    // 80 - 255 : CRITICAL
    else begin
        critical_led = 1'b1;
        alarm        = 1'b1;
    end

end

endmodule
