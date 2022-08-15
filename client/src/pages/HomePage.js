import { useState, useEffect } from "react";
import { Row } from "react-bootstrap";
import { Link } from "react-router-dom";

function HomePage() {
  const [categories, setCategories] = useState(null);
  useEffect(() => {
    fetchCategories();
  }, []);

  const fetchCategories = async () => {
    const url = "http://localhost:3001/categories/";
    const categoryResponse = await fetch(url).then((response) =>
      response.json()
    );
    setCategories(categoryResponse);
  };

  const isFetched = categories !== null && categories.length > 0;

  return (
    <>
      <Row>
        <h1>AWS Subjects</h1>
      </Row>
      <hr />
      {isFetched &&
        categories.map((category) => (
          <Row key={category.category}>
            <Link to={`category/${category.category}`}>
              <h2>{category.category}</h2>
            </Link>
          </Row>
        ))}
    </>
  );
}

export default HomePage;
