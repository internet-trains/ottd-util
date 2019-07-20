require("array.nut");

class Random {
    static function RandomAccessGSList(gslist) {
        local index = [];
        foreach (item, value in gslist) {
            index.push(item);
        }
        return index[GSBase.RandRange(index.len())];
    }
}

class DiscreteDistribution {
    _cmf = []
    _items = []
    _weight = 0

    constructor(gslist) {
        assert(!gslist.IsEmpty());
        foreach (item, value in gslist) {
            if (value <= 0) continue;
            this._cmf.append(this._weight);
            this._items.append(item);
            this._weight += value;
        }
    }

    function GetItem() {
        local i = Array.BinarySearch(this._cmf, GSBase.RandRange(this._weight));
        if (i < 0) i = ~i;
        if (i >= this._items.len()) i = this._items.len() - 1;
        return this._items[i];
    }

    static function SampleFrom(gsList, n=1) {
        if (n <= 0) return [];
        local dist = DiscreteDistribution(gslist);
        local ret = [];
        for (; n > 0; --n) {
            ret.append(dist.GetItem());
        }
        return ret;
    }
}