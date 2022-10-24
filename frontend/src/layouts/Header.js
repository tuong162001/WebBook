import { useEffect, useState } from "react";
import React from 'react';
import Apis, { endpoints } from "../configs/Apis";
import "./style.css";
import PrimarySearchAppBar from "./Components/Menu";



export default function Header() {
    const [data, setData] = useState([])

    useEffect(() => {
        const loadData = async () => {
            let res = await Apis.get(endpoints['categories'])
            setData(res.data)
        }
        loadData()

    }, [])


    return (
        <>
            <header>
                <div className="header-always-top">
                    <PrimarySearchAppBar />
                </div>
            </header>


        </>
    )

}