import "../assets/scss/checkout.scss";
import "../assets/order.css"
import { useEffect, useState } from "react";
import provinces from "./province.json"
import { useDispatch, useSelector } from "react-redux";
import _ from "lodash";
import cookie from "react-cookies";
import Apis, { endpoints } from "../configs/Apis";

import { useNavigate } from "react-router-dom"
import { shoppingCartActions } from "../store/actionReducer/shopping-cart-action";
// import dispatch from useDispatch();

const cartItems = [1, 2, 3]

const getDistrictByCity = (cities, id) => {
    if (id) {
        return cities.find(city => city.name === id).districts;
    }
    return cities[0].districts;
}
const getWardByDistrict = (districts, id) => {
    if (id) {
        let results = districts.find(district => district.name === id);
        if (results) return results.wards;
        return districts[0].wards;
    }
    return districts[0].wards;
}

function formatNumber(number) {
    return new Intl.NumberFormat('vn', { style: 'currency', currency: 'VND' }).format(number)
}

export default function Order() {
    const [informations, setInformations] = useState();
    let TotalPrice = 0
    const fetchInformation = async (event) => {
        // let token = localStorage.getItem("accessToken");
    }

    // const { isLogin, user } = useSelector(state => state.userReducer)
    const shoppingCard = useSelector(state => state.shoppingCart)
    // addres
    const [cities, setCities] = useState(provinces);
    const [districts, setDistricts] = useState();
    const [wards, setWards] = useState();
    const [selectedCity, setSelectedCity] = useState(provinces[0].name);
    const [selectedDistrict, setSelectedDistrict] = useState();
    const [selectedWard, setSelectedWard] = useState();
    const navigate = useNavigate();
    const dispatch = useDispatch()
    const {  user } = useSelector((state) => state.userReducer);

    useEffect(() => {
        // fetchInformation();
        let districtOptions = getDistrictByCity(cities, selectedCity);
        let wardOptions = getWardByDistrict(districtOptions, selectedDistrict);
        setDistricts(districtOptions);
        setWards(wardOptions);
        setSelectedDistrict(districtOptions[0].name);
        setSelectedWard(wardOptions[0].name);
    }, [selectedCity]);

    useEffect(() => {
        let districtOptions = getDistrictByCity(cities, selectedCity);
        let wardOptions = getWardByDistrict(districtOptions, selectedDistrict);
        setDistricts(districtOptions);
        setWards(wardOptions);
    }, [selectedDistrict]);

    function onCitySelect(option) {
        let target = option.target;
        let value = target.value;
        setSelectedCity(value)
    }
    function onDistrictSelect(option) {
        let target = option.target;
        let value = target.value;
        setSelectedDistrict(value)
    }
    function onWardSelect(option) {
        let target = option.target;
        let value = target.value;
        setSelectedWard(value)
    }
    const onInfomationsChange = (event) => {
        const target = event.target;
        const name = target.name;
        const value = target.value;
        setInformations((informations) => (
            {
                ...informations,
                [name]: value
            }
        ))
    }
    console.log(user);
    const handleCOD = async (event) => {
        event.preventDefault();
        if (!informations.fullname || !informations.phone || !informations.address) {
            alert('Vui l??ng nh???p th??ng tin giao h??ng')
            return
        }
        // let token = localStorage.getItem("access_token");
        let order = {
            "name_receiver": informations.fullname,
            "phone_receiver": informations.phone,
            "shipping_address": informations.address + ' ' + selectedCity + ' ' + selectedDistrict + ' ' + selectedWard,
            "price": TotalPrice,
            "order_status": "chua thanh toan",
            "paymentMethod": "Tien mat",
            "note": informations.note,
            "cart": shoppingCard
        }
        let res = await Apis.post(endpoints['order'], {
            "name_receiver": informations.fullname,
            "phone_receiver": informations.phone,
            "shipping_address": informations.address + ' ' + selectedCity + ' ' + selectedDistrict + ' ' + selectedWard,
            "price": TotalPrice,
            "order_status": "chua thanh toan",
            // "paymentMethod": "Tien mat",
            "note": informations.note,
            "shipping_fee": 0
        }, {
            headers: {
                "Authorization": `Bearer ${cookie.load("access_token")}`
            }
        })
        let id = res.data.id
        shoppingCard?.products.map(async (item) => {
            let res_detail = await Apis.post(endpoints['order-detail'](id), {
                'price': item.price,
                'quantity': item.qty,
                'book': item.id,
                'name': item.book_name
            }, {
                'content-type': 'application/json'
            })
        })
        alert("?????t h??ng th??nh c??ng!")
        setTimeout(() => {
            dispatch(shoppingCartActions.initProduct)
            navigate("/")
            window.location.reload();
            
        }, 1000);
    }





    return (
        <>
            <div className="space-empty"></div>
            <div className="checkout-area pt-95 pb-100">
                <div className="container">
                    <div className="row">
                        {/* order left */}
                        <div className="col-lg-7">
                            <div className="billing-info-wrap">
                                <h3>Th??ng tin giao h??ng</h3>
                                <div className="row">
                                    <div className="col-lg-12">
                                        <div className="billing-info mb-20">
                                            <label>H??? t??n</label>
                                            <input
                                                type="text"
                                                name="fullname"
                                                // value={informations.fullname}
                                                onChange={(event) => onInfomationsChange(event)}
                                                required
                                                value={user.first_name + " " + user.last_name}
                                            />
                                        </div>
                                    </div>

                                    <div className="col-lg-12">
                                        <div className="billing-info mb-20">
                                            <label>S??? ??i???n tho???i</label>
                                            <input
                                                type="text"
                                                name="phone"
                                                onChange={(event) => onInfomationsChange(event)}
                                                // value={informations.phone}
                                                required
                                            />
                                        </div>
                                    </div>

                                    <div className="col-lg-12">
                                        <div className="billing-select mb-20">
                                            <label>T???nh/Th??nh</label>
                                            <select onChange={(option) => onCitySelect(option)}>
                                                {cities && cities.map((value, key) => {
                                                    return (
                                                        <option key={key} value={value.name}>{value.name}</option>)
                                                })
                                                }
                                            </select>
                                        </div>
                                    </div>

                                    <div className="col-lg-12">
                                        <div className="billing-select mb-20">
                                            <label>Qu???n/Huy???n</label>
                                            <select onChange={(option) => onDistrictSelect(option)}>
                                                {districts && districts.map((value, key) => {
                                                    return (
                                                        <option key={key} value={value.name}>{value.name}</option>)
                                                })
                                                }
                                            </select>
                                        </div>
                                    </div>

                                    <div className="col-lg-12">
                                        <div className="billing-select mb-20">
                                            <label>Ph?????ng/X??</label>
                                            <select onChange={(option) => onWardSelect(option)}>
                                                {wards && wards.map((value, key) => {
                                                    return (
                                                        <option key={key} value={value.name}>{value.name}</option>)
                                                })
                                                }
                                            </select>
                                        </div>
                                    </div>

                                    <div className="col-lg-12">
                                        <div className="billing-info mb-20">
                                            <label>?????a ch???</label>
                                            <input
                                                className="billing-address"
                                                placeholder="vd: 273 An D????ng V????ng"
                                                type="text"
                                                name="address"
                                                onChange={(event) => onInfomationsChange(event)}
                                                // value={informations.address}
                                                required
                                            />
                                        </div>
                                    </div>
                                </div>
                                <div className="additional-info-wrap">
                                    <h4>Ghi ch??</h4>
                                    <div className="additional-info">
                                        <textarea
                                            placeholder="Th??m ghi cho ????n h??ng n???u c???n thi???t. "
                                            name="note"
                                            defaultValue={""}
                                            onChange={(event) => onInfomationsChange(event)}
                                        />
                                    </div>
                                </div>
                            </div>
                        </div>
                        {/* order right */}
                        <div className="col-lg-5">
                            <div className="your-order-area">
                                <h3>H??a ????n</h3>
                                <div className="your-order-wrap gray-bg-4">
                                    <div className="your-order-product-info">
                                        <div className="your-order-top">
                                            <ul>
                                                <li>S???n ph???m</li>
                                            </ul>
                                        </div>
                                        <div className="your-order-middle">
                                            <ul>
                                                {shoppingCard?.products.map((item, key) => {
                                                    TotalPrice += item.price * item.qty;
                                                    return (
                                                        <li key={key}>
                                                            <span className="order-middle-left">
                                                                {item.book_name} X {item.qty}
                                                            </span>{" "}
                                                            <span className="order-price">
                                                                {formatNumber(item.price * item.qty)}
                                                            </span>
                                                        </li>
                                                    );
                                                })
                                                }
                                            </ul>
                                        </div>
                                        <div className="your-order-bottom">
                                            <ul>
                                                <li className="your-order-shipping">Ph?? v???n chuy???n</li>
                                                <li>Mi???n ph??</li>
                                            </ul>
                                        </div>
                                        <div className="your-order-bottom">
                                            <ul>
                                                <li className="your-order-shipping">Voucher gi???m gi??</li>
                                                {/* <li>- {formatter.format(discount)}</li> */}
                                            </ul>
                                        </div>
                                        <div className="your-order-total">
                                            <ul>
                                                <li className="order-total">T???ng ti???n</li>
                                                <li>
                                                    {formatNumber(_.sum(shoppingCard?.products.map(p => p.qty * Number(p.price))))}
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div className="payment-method"></div>
                                </div>

                                <div className="place-order mt-25">
                                    <button
                                        className="btn-hover"
                                        // type="submit"
                                        // onClick={(event) => handleCheckout(event)}
                                        onClick={(event) => handleCOD(event)}
                                    >Thanh to??n COD</button>
                                </div>
                                <div className="place-order mt-10 ">
                                    <button
                                        className="btn-hover"
                                        type="submit"
                                    // onClick={(event) => handleOnline(event)}
                                    ><a href="" />Thanh to??n Online qua NCB</button>
                                </div>
                                <div className="mt-4">
                                    <div className="discount-code-wrapper">
                                        <div className="title-wrap">
                                            <h4 className="cart-bottom-title section-bg-gray">
                                                S??? d???ng m?? khuy???n m??i
                                            </h4>
                                        </div>
                                        <div className="discount-code">
                                            <p>H??y nh???p m?? khuy???n m??i</p>
                                            <form
                                            >
                                                <input
                                                    type="text"
                                                    name="voucher"
                                                />
                                                <button
                                                    className="cart-btn-2"
                                                    type="submit"
                                                >
                                                    S??? d???ng m??
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </>

    );
}