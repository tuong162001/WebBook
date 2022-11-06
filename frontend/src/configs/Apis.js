import axios from "axios";

export let endpoints = {
  'categories': "/categories/",
  'books': "/books/",
  "oauth2-info": "/oauth2-info/",
  'login': "/o/token/",
  "current-user": "/users/current_user/",
  'register': "/users/",
  'order': "/orders/add-order/",
  "order-detail": (id) => `/orders/${id}/add-detail/`,
  "order-all": "/orders/",
  "author": "/author/",
  "company": "/company/",
  "detail-book" : (id) => `/books/${id}/`,
  "comment": (id) => `/books/${id}/comments/`,
  "add-comment": (id) => `/books/${id}/add-comment/`,
  "rating": (id) => `/books/${id}/rating/`,
  "detail-order": "/order_detail/",
};
export default axios.create({
  baseURL: "http://localhost:8000/",
});
