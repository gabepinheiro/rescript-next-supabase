let default = pageProps => {
  Console.log(pageProps)

  <main>
    <h1> {"Home Page"->React.string} </h1>
  </main>
}

let getStaticProps = async () => {
  let result = await TodoService.getTodos()

  switch result {
  | Ok(Some(data)) => {"props": {"data": data}}
  | Ok(None) => {"props": {"data": []}}
  | Error(message) =>
    Console.log(message)
    Obj.magic({
      "props": {
        "error": true,
      },
    })
  }
}
