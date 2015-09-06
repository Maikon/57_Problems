-module(multiplication_table_tests).

-include_lib("eunit/include/eunit.hrl").

generates_table_of_variable_size_test() ->
    [
     {0, 0, 0},
     {0, 1, 0},
     {0, 2, 0},
     {1, 0, 0},
     {1, 1, 1},
     {1, 2, 2},
     {2, 0, 0},
     {2, 1, 2},
     {2, 2, 4}
    ] = multiplication_table_app:generate(2).

prints_the_table_test() ->
    Table = [{0, 0, 0},
             {0, 1, 0},
             {1, 0, 0},
             {1, 1, 1}],
    [ok, ok, ok, ok] = multiplication_table_app:print(Table).

converts_number_to_string_test() ->
    "1" = multiplication_table_app:convert_to_string(1).
