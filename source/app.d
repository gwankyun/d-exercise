import std.stdio;
import std.algorithm;
import std.string;
import std.logger;
import core.memory; // GC.collect

// 自動推導
auto add(int a, int b)
{
    return a + b;
}

//　默認參數
void plot(string msg, string color = "red")
{
    infof("msg: %s colr: %s", msg, color);
}

void fun()
{
    int local = 10;
    // 嵌套函數
    int fun_secret()
    {
        local++;
        return 0;
    }
    fun_secret();
    infof("local: %s", local);
}

struct Person
{
    int age;
    string name;

    // 構造函數
    this(int age, string name)
    {
        this.age = age;
        this.name = name;
    }
}

// 安全
void saftFun() @safe
{
    info("");
    int* p = new int;
}

// 不安全
void unsafeFun() @system
{
    int* p = new int;
    int* fiddling = p + 5;
}

// 接口安全，內部自己保證
void memory() @trusted
{
    int a = 1;
    int* b = &a;
    auto c = b;
    infof("c: %s", *c);
    saftFun();
    unsafeFun();

    GC.collect(); // 手動執行回收
    GC.disable(); // 手動關
    GC.enable();  // 手動開
}

void main()
{
    writeln("hello");
    bool t = true;
    writeln(t);
    writeln("stringof: ", int.stringof);
    writeln("sizeof: ", int.sizeof);
    writeln("min: ", int.min);
    writeln("max: ", int.max);
    writeln("init: ", int.init);

    char c = 'a';
    wchar wc = 'π';
    dchar dc = '好';
    writeln(c);
    writeln(wc);
    writeln(dc);

    // 數組
    int[5] array;
    writeln(array.length);
    int[] dynamic_array;
    dynamic_array ~= 3;
    dynamic_array ~= 7;
    dynamic_array ~= [ 2, 1 ];
    writeln(dynamic_array.length);
    writeln(dynamic_array);
    dynamic_array = dynamic_array.remove(0);
    writeln(dynamic_array);

    // 函數
    writeln(add(1, 2));

    Person person;
    person.age = 20;
    person.name = "Tom";
    infof("person: %s", person);
    auto jim = Person(18, "Jom");
    infof("Jom: %s", jim);

    // 日誌
    info("info");
    warning("");
    error("");
    critical("");
    // 會直接報錯
    // fatal("");
    infof("info: %s", "test");

    // 類型轉換
    byte b = 8;
    short s = cast(short)b;
    infof("byte to short: %s", s);

    infof("init: %s", int.init); // 初始值
    assert(int.init == 0);
    infof("init: %s", double.init); // 初始值
    // assert(double.init == double.nan);
    infof("max: %s", int.max); // 最大
    infof("min: %s", int.min); // 最小
    infof("min_normal: %s", double.min_normal); // 可表示的最小值
    infof("nan: %s", double.nan); // 非數值
    infof("infinity: %s", double.infinity); // 極限
    infof("dig: %s", double.dig); // 十進制精度
    infof("mant_dig: %s", double.mant_dig); // 小數部分精度
    infof("stringof: %s", int.stringof); // 名稱
    auto a = 8;
    infof("type: %s", typeid(a));
    infof("sizeof: %s", int.sizeof);

    // 內存
    memory();

    plot("D");
    plot("D", "blue");

    fun();
}
