type env = {
  @as("NEXT_PUBLIC_SUPABASE_API_URL")
  supabaseApiUrl: string,
  @as("NEXT_PUBLIC_SUPABASE_ANON_KEY")
  supabaseAnonKey: string,
}

@val @scope("process") external env: env = "env"
