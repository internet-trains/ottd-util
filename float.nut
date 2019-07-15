class Float {
    static function ToMantissaAndExp(x) {
        if (x == 0) return {mantissa = 0, exponent = 0};
        local exponent = 0;
        while (x % 2 == 0) {
            x /= 2;
            ++exponent;
        }
        while (x % 1 != 0) {
            x *= 2;
            --exponent;
        }
        return {mantissa = tointeger(x), exponent = exponent};
    }

    static function FromMantissaAndExp(t) {
        local x = tofloat(t.mantissa);
        local i = t.exponent;
        while (i < 0) {
            x /= 2;
            ++i;
        }
        while (i > 0) {
            x *= 2;
            --i;
        }
        return x;
    }
}