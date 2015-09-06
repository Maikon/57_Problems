# Problem 30

To run this you will Erlang 17.0 or higher and it's build tool ([rebar](https://github.com/rebar/rebar)).

If you have the above already go to the project directory and do the following:

```
rebar compile
escript src/multiplication_table_app.erl <number>
```

You could also run it within the Erlang shell:

```
erl
> c("src/multiplication_table_app").
{ok,multiplication_table_app}
> multiplication_table_app:generate(5).
```
