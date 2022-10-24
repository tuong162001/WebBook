import { createBrowserHistory } from "history";
import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import Apis, { endpoints } from "../../configs/Apis";
import "./styleLogin.css";

export default function SignUpForm() {

    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')
    const [confirmPassword, setConfirmPassword] = useState('')
    const [firstName, setFirstName] = useState('')
    const [LastName, setLastName] = useState('')
    const [isShowPass, setIsShowPass] = useState(true)
    const [email, setEmail] = useState('')
    const navigate = useNavigate()
    const [error1, setError1] = useState(false)


    const handleRegister = (event) => {
        event.preventDefault()
        let registerUser = async () => {
            const formData = new FormData()
            formData.append("first_name", firstName)
            formData.append("last_name", LastName)
            formData.append("username", username)
            formData.append("password", password)
            formData.append("email", email)

            try {
                let res = await Apis.post(endpoints['register'], formData, {
                    headers: {
                        "Content-Type": "multipart/form-data"
                    }
                }).then(response => {
                    console.log(response)
                    if (response.status === 201) {
                        window.location.reload()
                    }
                }).catch((err) => {
                    if (err.response) {
                        alert(Object.keys(err.response.data)[0] + ' error');
                    }
                })


            } catch (error) {
                console.log(error)
            }

        }
        if (password !== null && password === confirmPassword) {
            registerUser()
        } else {
            alert('password error')
        }


    }


    return (
        <>
            <form className="form" onSubmit={handleRegister} >
                <div className='col-12 form-group input-login'>
                    <label>Firs tName</label>
                    <input className='form-control' type='text'
                        value={firstName}
                        onChange={(event) => setFirstName(event.target.value)}
                    />
                </div>
                <div className='col-12 form-group input-login'>
                    <label>Last Name</label>
                    <input className='form-control' type='text'
                        value={LastName}
                        onChange={(event) => setLastName(event.target.value)}
                    />
                </div>
                <div className='col-12 form-group input-login'>
                    <label>User Name</label>
                    <input className='form-control' type='text'
                        value={username}
                        onChange={(event) => setUsername(event.target.value)}
                    />
                </div>
                <div className='col-12 form-group input-login'>
                    <label>Password</label>

                    <div className='custom-input-password'>
                        <input className='form-control'
                            type={isShowPass ? 'text' : 'password'}
                            value={password}
                            onChange={(event) => setPassword(event.target.value)}
                        />
                        <span >
                            <i className={!isShowPass ? "far fa-eye" : "far fa-eye-slash"}></i>
                        </span>

                    </div>
                </div>
                <div className='col-12 form-group input-login'>
                    <label>Confirm Password</label>

                    <div className='custom-input-password'>
                        <input className='form-control'
                            type={isShowPass ? 'text' : 'password'}
                            value={confirmPassword}
                            onChange={(event) => setConfirmPassword(event.target.value)}
                        />
                        <span >
                            <i className={!isShowPass ? "far fa-eye" : "far fa-eye-slash"}></i>
                        </span>

                    </div>
                </div>
                <div className='col-12 form-group input-login'>
                    <label>Email</label>

                    <div className='custom-input-password'>
                        <input className='form-control'
                            type={isShowPass ? 'text' : 'password'}
                            value={email}
                            onChange={(event) => setEmail(event.target.value)}
                        />
                        <span >
                            <i className={!isShowPass ? "far fa-eye" : "far fa-eye-slash"}></i>
                        </span>

                    </div>
                </div>

                <div className='col-12'>
                    <button className='btn-login'>Register</button>
                </div>

                <div className='col-12'>
                    <span>Ban da co tai khoan?</span>
                </div>

            </form>
        </>
    );
}
