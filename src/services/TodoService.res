open Env

let apiUrl = env.supabaseApiUrl
let anonKey = env.supabaseAnonKey

module SupabaseClient = Supabase.SupabaseClient

let supabase = SupabaseClient.createClient(~apiUrl, ~anonKey)

let getTodos = async () => {
  open Supabase.QueryBuilder

  let {data, error} = await supabase->from(~table="todos")->select("*")

  switch (data->Js.Nullable.toOption, error->Js.Nullable.toOption) {
  | (Some(data), None) => Ok(Some(data))
  | (None, None) => Ok(None)
  | (_, Some({message})) => Error(message)
  }
}

let getTodoById = async (id: string) => {
  open Supabase.QueryBuilder

  let result =
    await supabase
    ->from(~table="todos")
    ->selectReturnsQueryBuild("*")
    ->eq(~columnName="id", ~value=id)

  Console.log(result)
}
