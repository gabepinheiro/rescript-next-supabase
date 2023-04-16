module SupabaseClient = {
  type t
  @module("@supabase/supabase-js")
  external createClient: (~apiUrl: string, ~anonKey: string) => t = "createClient"
}

module QueryBuilder = {
  type t

  type error = {
    code: string,
    message: string,
  }

  type result<'data> = {
    data: Js.Nullable.t<'data>,
    error: Js.Nullable.t<error>,
  }

  @send external from: (SupabaseClient.t, ~table: string) => t = "from"

  @send
  external select: (t, string) => promise<result<'a>> = "select"

  @send
  external selectReturnsQueryBuild: (t, string) => t = "select"

  @send external delete: unit => t = "delete"

  @send external eq: (t, ~columnName: string, ~value: 'a) => promise<result<'a>> = "eq"
}
