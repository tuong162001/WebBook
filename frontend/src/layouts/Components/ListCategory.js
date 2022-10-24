
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import Apis, { endpoints } from "../../configs/Apis";
import "./style.css";



export default function ListCategory() {
    // const [categories, setCategories] = useState([])
    const [categories, setCategories] = useState([])
    const [data1, setData1] = useState()
    const navigate = useNavigate()

    useEffect(() => {
        const loadCategories = async () => {
            let res = await Apis.get(endpoints['categories'])

            setCategories(res.data)
            setData1(res.data)
        }

        // console.log(categories)
        loadCategories()

    }, [])
    const handleListMenu = (itm) => {
        let path = `/?category_id=${itm.id}`
        navigate(path)
    }


    return (
        <div className="list-category main-nav-wrap fixed-menu  l3"
        // style={{ position: 'fixed', zIndex: 99999999 }}
        >
            <ul>
                <li><a href="#">Sách bán chạy trong tuần</a></li>
                <li><a href="#">Sách bán chạy trong tháng</a></li>
                <li><a href="#">Sách mới xuất bản</a></li>
                {categories.map((itm, idx) => {
                    // let path = `/?category_id=${itm.id}`
                    // console.log(itm.parent_id)
                    if (itm.parent_id === 0)

                        return (
                            <li key={idx} >
                                <a >{itm.category_name}</a>
                                <div className="nav-sub">
                                    {data1.map((itm, idx) => {
                                        // let path = `/?category_id=${itm.id}`
                                        if (itm.parent_id === 1)
                                            return (
                                                <ul>
                                                    <li key={idx}>
                                                        <div className="nav-sub-list-box">
                                                            <a style={{ cursor: 'pointer' }} onClick={() => handleListMenu(itm)}><h2>{itm.category_name}</h2></a>
                                                        </div>
                                                    </li>
                                                </ul>
                                            )


                                    })}


                                </div>
                            </li>

                        )
                })}
            </ul>
        </div >
    )

}
