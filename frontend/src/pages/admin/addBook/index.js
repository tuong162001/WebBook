import { useEffect, useRef, useState } from "react";
import Apis, { endpoints } from "../../../configs/Apis";
import "./style.scss";
import Modal from "react-modal";
import { useLocation } from "react-router-dom";
import { Button } from "react-bootstrap";

export default function AddBook() {
  const [data, setData] = useState([]);
  const [data1, setData1] = useState([]);
  const [data2, setData2] = useState([]);
  const [data3, setData3] = useState([]);
  const [isShowing, setIsShowing] = useState(false);
  const [bookName, setBookName] = useState();
  const [publicDate, setPublicDate] = useState();
  const [author, setAuthor] = useState();
  const [numberPage, setNumberPage] = useState();
  const [quantity, setQuantity] = useState();
  const image = useRef();
  const [descirption, setDescirption] = useState();
  const [category, setCategory] = useState();
  const [company, setCompany] = useState();
  const [price, setPrice] = useState();
  const [prev, setPrev] = useState(false);
  const [next, setNext] = useState(false);
  const [page, setPage] = useState(1);
  const location = useLocation();


  useEffect(() => {
    const loadData = async () => {
      let query = "";
      if (query === "") query = `?page=${page}`;
      else query += `&page=${page}`;
      let res = await Apis.get(`${endpoints["books"]}${query}`);
        setData(res.data.results);
        setNext(res.data.next !== null);
        setPrev(res.data.previous !== null);
      let res1 = await Apis.get(endpoints["categories"]);
      let res2 = await Apis.get(endpoints["author"]);
      let res3 = await Apis.get(endpoints["company"]);
    console.log(res.data);
      setData3(res3.data);
      setData1(res1.data);
      setData2(res2.data);
      setData(res.data.results);
    };
    loadData();
  }, [page]);
  const paging = (inc) => {
    setPage(page + inc);
  };
  const handleSubmit = async (event) => {
    event.preventDefault();
    let addBook = async () => {
      const formData = new FormData();
      formData.append("book_name", bookName);
      formData.append("public_date", publicDate);
      formData.append("number_of_pages", numberPage);
      formData.append("quantity", quantity);
      formData.append("price", price);
      formData.append("description", descirption);
      formData.append("book_image", image.current.files[0]);
      formData.append("author_id", author);
      formData.append("category_id", category);
      formData.append("company_id", company);
      console.log(formData);
      let res = await Apis.post(endpoints["books"], formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
      setBookName("")
      setPublicDate("")
      setQuantity("")
      setDescirption("")
      setPrice("")
    };
    
    addBook();
  };

  return (
    <>
      <button
        className="btn btn-primary"
        style={{ margin: 10 }}
        onClick={() => setIsShowing(!isShowing)}
      >
        Thêm sách
      </button>
      <Modal isOpen={isShowing} ariaHideApp={false}>
        <form onSubmit={handleSubmit}>
          <div className="form-group">
            <label>Tên sách:</label>
            <input
              name="bookName"
              type="text"
              className="form-control"
              onChange={(event) => setBookName(event.target.value)}
              value={bookName}
            />
          </div>
          <div className="form-group">
            <label>Ngày xuất bản:</label>
            <input
              name="publisDate"
              type="date"
              className="form-control"
              onChange={(event) => setPublicDate(event.target.value)}
              value={publicDate}
            />
          </div>
          <div className="form-group">
            <label>Tác giả:</label>
            <select
              name="author"
              className="custom-select"
              onChange={(event) => setAuthor(event.target.value)}
              value={author}
            >
              <option selected value={0}></option>
              {data2?.map((item, idx) => {
                return (
                  <option selected value={item.id} key={item.id}>
                    {item.author_name}
                  </option>
                );
              })}
            </select>
          </div>
          <div className="form-group">
            <label>Số trang:</label>
            <input
              name="number_page"
              type="number"
              className="form-control"
              onChange={(event) => setNumberPage(event.target.value)}
              value={numberPage}
            />
          </div>
          <div className="form-group">
            <label>Số lượng:</label>
            <input
              name="quantity"
              type="text"
              className="form-control"
              onChange={(event) => setQuantity(event.target.value)}
              value={quantity}
            />
          </div>
          <div className="form-group">
            <label>Giá:</label>
            <input
              name="price"
              type="text"
              className="form-control"
              onChange={(event) => setPrice(event.target.value)}
              value={price}
            />
          </div>
          <div className="form-group">
            <label>Ảnh:</label>
            <input name="image" type="file" v="form-control" ref={image} />
          </div>
          <div className="form-group">
            <label>Mô tả:</label>
            <input
              name="descirption"
              t
              type="text"
              className="form-control"
              onChange={(event) => setDescirption(event.target.value)}
              value={descirption}
            />
          </div>
          <div className="form-group">
            <label>Danh mục:</label>
            <select
              name="category"
              className="custom-select"
              onChange={(event) => setCategory(event.target.value)}
              value={category}
            >
              <option selected value={0}></option>
              {data1?.map((item, idx) => {
                return (
                  <option selected value={item.id} key={item.id}>
                    {item.category_name}
                  </option>
                );
              })}
            </select>
          </div>
          <div className="form-group">
            <label>Công ty:</label>
            <select
              name="company"
              className="custom-select"
              onChange={(event) => setCompany(event.target.value)}
              value={company}
            >
              <option selected value={0}>
                Chọn
              </option>
              {data3?.map((item, idx) => {
                return (
                  <option
                    selected
                    defaultValue={item.id}
                    value={item.id}
                    key={item.id}
                  >
                    {item.company_name}
                  </option>
                );
              })}
            </select>
          </div>
          <button
            type="submit"
            onClick={handleSubmit}
            className="btn btn-primary "
          >
            Submit
          </button>
          <button
            className="btn btn-primary "
            onClick={() => setIsShowing(!isShowing)}
          >
            Đóng
          </button>
        </form>
      </Modal>

      <h1>Quản lí sách</h1>
      <div style={{ width: "100%" }}>
        <table style={{ width: "100%" }}>
          <thead>
            <tr>
              <th>Tên</th>
              <th>Giá</th>
              <th>Số lượng</th>
              <th>Số trang</th>
              <th>Ngày xuất bản</th>
            </tr>
          </thead>
          <tbody>
            {data?.map((item, idx) => {
              return (
                <tr key={idx}>
                  <td>{item.book_name}</td>
                  <td>{item.price}</td>
                  <td>{item.quantity}</td>
                  <td>{item.number_of_pages}</td>
                  <td>{item.public_date}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
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
    </>
  );
}
