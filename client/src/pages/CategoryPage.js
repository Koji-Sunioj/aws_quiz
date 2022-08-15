import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import { Row } from "react-bootstrap";

const CategoryPage = () => {
  const { category } = useParams();
  const [terms, setTerms] = useState(null);

  const fetchCategory = async () => {
    const url = "http://localhost:3001/categories/" + category;
    const categoryResponse = await fetch(url).then((response) =>
      response.json()
    );
    categoryResponse.forEach((term) => {
      term.hidden = true;
    });
    setTerms(categoryResponse);
  };

  useEffect(() => {
    fetchCategory(category);
  }, [category]);

  const isCatFetched = terms !== null && terms.length > 0;

  const unHideCategory = (id) => {
    const termsCopy = [...terms];
    termsCopy.forEach((term) => {
      if (term.id === id && term.hidden) {
        term.hidden = false;
      } else if (term.id === id && !term.hidden) {
        term.hidden = true;
      }
    });

    setTerms(termsCopy);
  };

  return (
    <>
      <Row>
        <h1>{category}</h1>
      </Row>
      <hr />
      {isCatFetched &&
        terms.map((term) => (
          <Row key={term.id}>
            <br />
            <h2
              onClick={() => {
                unHideCategory(term.id);
              }}
            >
              {term.term}
            </h2>
            <p hidden={term.hidden}>{term.description}</p>
          </Row>
        ))}
    </>
  );
};

export default CategoryPage;
