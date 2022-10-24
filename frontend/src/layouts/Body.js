import Footer from "../layouts/Footer";
import Header from "../layouts/Header";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Home from "../pages/home";
import tesst from "./test";
import Login from "../pages/login";
import SignInForm from "./Components/SignInForm";
import ShoppingCard from "../pages/shoppingCard/shoppingCard";
import Order from "../pages/order";
import { useSelector } from "react-redux";
import Admin from "../pages/admin";
import Statistic from "../pages/admin/statistic";
import AddBook from "../pages/admin/addBook";
import AddAuthor from "../pages/admin/addAuthor";
import AddCompany from "../pages/admin/addCompany";
import DetailBook from "../pages/detailBook";

export default function Body() {
  const { isLogin, user } = useSelector((state) => state.userReducer);
  if (!user?.is_superuser) {
    return (
      <BrowserRouter>
        <Header />
        <Routes>
          <Route exact path="/" element={<Home />} />
          <Route exact path="/books" element={<Home />} />
          <Route exact path="/login" element={<Login />} />
          <Route exact path="/shopping-card" element={<ShoppingCard />} />
          <Route exact path="/order" element={<Order />} />
          <Route exact path="/books/:id/" element={<DetailBook />} />
        </Routes>
        <Footer />
      </BrowserRouter>
    );
  } else {
    return (
      <BrowserRouter>
        <Admin />
        <Routes>
          <Route exact path="/thong-ke" element={<Statistic />} />
          <Route exact path="/add-book" element={<AddBook />} />
          <Route exact path="/add-author" element={<AddAuthor />} />
          <Route exact path="/add-company" element={<AddCompany />} />
        </Routes>
      </BrowserRouter>
    );
  }
}
