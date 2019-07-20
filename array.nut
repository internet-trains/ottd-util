class Array {
    static function BinarySearch(arr, value, comp=@(a,b) a <=> b) {
        local lo = 0;
        local hi = arr.len() - 1;
        while (lo <= hi) {
            local i = lo + ((hi - lo) >> 1);
            local c = comp(arr[i], value);
            if (c == 0) return i;
            if (c < 0) {
                lo = i + 1;
            } else {
                hi = i - 1;
            }
        }
        return ~lo;
    }
}