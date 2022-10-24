import { useEffect, useState } from "react";
import { Button, ButtonGroup, Container, Row } from "react-bootstrap";
import { useLocation } from "react-router-dom";
import Apis, { endpoints } from "../configs/Apis";
import Ecard from "../layouts/Components/Card";
import { useDispatch, useSelector } from "react-redux";
import ListCategory from "../layouts/Components/ListCategory";
import SwipeableTextMobileStepper from "../layouts/Components/SliderQC";
import "./style.css";

export default function Home() {
  const [data, setData] = useState([]);
  const location = useLocation();
  const shoppingCard = useSelector((state) => state.shoppingCart);
  const [prev, setPrev] = useState(false);
  const [next, setNext] = useState(false);
  const [page, setPage] = useState(1);

  useEffect(() => {
    const loadData = async () => {
      let query = location.search;
      if (query === "") query = `?page=${page}`;
      else query += `&page=${page}`;
      try {
        let res = await Apis.get(`${endpoints["books"]}${query}`);
        setData(res.data.results);
        setNext(res.data.next !== null);
        setPrev(res.data.previous !== null);
      } catch (error) {
        console.log(error);
      }
    };
    loadData();
  }, [location.search, page]);
  const paging = (inc) => {
    setPage(page + inc);
  };
  const truoc = <> <h1> `{'>>'}` </h1> </>
  return (
    <>
      <Container>
        <div className="slider-list-flex">
          <ListCategory />
          <SwipeableTextMobileStepper />
        </div>
        <hr />
        {/* <h1 style={{ height: 10000 }}>My Hhome</h1> */}
        <h1>Sách Tiếng Việt</h1>
        <Row>
          {data.map((itm, idx) => {
            const find = shoppingCard?.products?.find((f) => f.id === itm.id);
            let count = 0;
            if (find) {
              count = find?.qty;
            }
            return <Ecard key={idx} obj={itm} count={count} type="id" />;
          })}
        </Row>
        <div className="pagination-button">
          <Button 
          style={{borderRadius:'45%',color:'red'}}
          // variant="info" 
          onClick={() => paging(-1)} disabled={!prev}>
            {'<<'}
          </Button>
          <Button
            // variant="info"
            style={{borderRadius:'45%',color:'red'}}
            onClick={() => paging(1)}
            disabled={!next}
          >
            {'>>'}
          </Button>
        </div>
      </Container>
    </>
  );
}
