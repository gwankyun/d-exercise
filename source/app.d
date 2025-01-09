import std.stdio;
import std.algorithm;
import std.string;

int add(int a, int b) {
    return a + b;
}

struct Person {
    int age;
    string name;
}

void main() {
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
    writeln(person);
}
