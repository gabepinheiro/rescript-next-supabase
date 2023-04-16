import Home from "../src/pages/Home.bs";

export { getStaticProps } from "../src/pages/Home.bs";

export default function HomePage(props) {
  return <Home {...props} />;
}
