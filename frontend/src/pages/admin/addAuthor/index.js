import { useEffect, useRef, useState } from "react";
import Modal from "react-modal";
import Apis, { endpoints } from "../../../configs/Apis";
import "./style.css";

export default function AddAuthor() {
  const [data, setData] = useState([]);
  const [isShowing, setIsShowing] = useState(false);
  const image = useRef();
  const [name, setName] = useState();
  const [descirption, setDescirption] = useState();

  useEffect(() => {
    const loadData = async () => {
      let res = await Apis.get(endpoints["author"]);

      setData(res.data);
    };
    loadData();
  }, []);
  //   console.log("author", data);

  const handleSubmit = (event) => {
    event.preventDefault();
    let addAuthor = async () => {
      const formData = new FormData();
      formData.append("author_name", name);
      formData.append("author_info", descirption);
      formData.append("author_image", image.current.files[0]);
      console.log(formData);
      let res = await Apis.post(endpoints["author"], formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });
    };
    addAuthor();
  };
  console.log(isShowing);
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
            <label>Tên tác giả:</label>
            <input
              name="bookName"
              type="text"
              className="form-control"
              onChange={(event) => setName(event.target.value)}
              value={name}
            />
          </div>
          <div className="form-group">
            <label>Ảnh:</label>
            <input name="image" type="file" v="form-control" ref={image} />
          </div>
          <div className="form-group">
            <label>Thông tin:</label>
            <input
              name="descirption"
              t
              type="text"
              className="form-control"
              onChange={(event) => setDescirption(event.target.value)}
              value={descirption}
            />
          </div>
          <button
            type="submit"
            onClick={handleSubmit}
            className="btn btn-primary submit"
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
      <h1>Quản lý Tác giả</h1>
      <div style={{ width: "100%" }}>
        <table style={{ width: "100%" }}>
          <thead>
            <tr>
              <th>Tên tác giả</th>
              <th>Thông tin</th>
              <th>Ảnh</th>
            </tr>
          </thead>
          <tbody>
            {data?.map((item, idx) => {
              return (
                <tr key={idx}>
                  <td>{item.author_name}</td>
                  <td>{item.author_info}</td>
                  <td>
                    <img height={100} width={100} src={item.author_image} />
                  </td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
    </>
  );
}
