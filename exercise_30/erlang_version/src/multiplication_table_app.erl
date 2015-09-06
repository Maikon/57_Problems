-module(multiplication_table_app).
-include_lib("wx/include/wx.hrl").

-export([main/1, generate/1, print/1, convert_to_string/1]).

main(_Args) ->
    Num = convert_to_num(lists:nth(1, _Args)),
    Dim = Num + 1,
    Table = generate(Num),
    WX = wx:new(),
    Frame = wxFrame:new(WX, ?wxID_ANY, "Multiplication Table"),
    Grid  = wxGrid:new(Frame, ?wxID_ANY),
    wxGrid:createGrid(Grid, Dim, Dim),
    [update_grid(Grid, X, Y, Result) || {X, Y, Result} <- Table],
    wxFrame:show(Frame).

generate(_dimension) ->
    Range = lists:seq(0, _dimension),
    [{X, Y, X * Y} || X <- Range, Y <- Range].

print(_table) ->
    [io:format("~B x ~B = ~B~n", [X, Y, Result]) || {X, Y, Result} <- _table].

convert_to_string(_num) ->
    lists:flatten(io_lib:format("~B", [_num])).

convert_to_num(_num) ->
    {Num, _} = string:to_integer(_num),
    Num.

update_grid(Grid, X, Y, Result) ->
    wxGrid:setCellValue(Grid, X, Y,  convert_to_string(Result)),
    wxGrid:setColLabelValue(Grid, X, convert_to_string(X)),
    wxGrid:setRowLabelValue(Grid, X, convert_to_string(X)),
    wxGrid:setReadOnly(Grid, X, Y, []).
