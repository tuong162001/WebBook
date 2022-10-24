import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import IconButton from "@material-ui/core/IconButton";
import MenuIcon from "@material-ui/icons/Menu";
import { useDispatch } from "react-redux";
import { logoutUser } from "../../store/actionReducer/user";
import cookie from "react-cookies";
import { Box, MenuItem } from "@material-ui/core";
import { useNavigate } from "react-router-dom";
const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  title: {
    // flexGrow: 1,
    color: "white",
  },
  flex_start: {
    // color: 'white',
    // flexGrow: 100,
  },
}));

export default function Admin() {
  const classes = useStyles();
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleLogout = (event) => {
    event.preventDefault();
    cookie.remove("access_token");
    dispatch(logoutUser());
  };
  const handleThongke = () => {
    navigate("thong-ke");
  };
  const handleBook = () => {
    navigate("add-book");
  };
  const handleAuthor = () => {
    navigate("add-author");
  };

  const handleCompany = () => {
    navigate("add-company");
  };

  return (
    <div className={classes.root}>
      <AppBar position="static">
        <Toolbar>
          <Box sx={{ flexGrow: 1, display: "flex" }}>
            <Typography variant="h6" color="inherit">
              SikiBook
            </Typography>
            <MenuItem style={{ marginLeft: 50 }}>
              <Typography onClick={handleThongke} color="inherit">
                Thống Kê
              </Typography>
            </MenuItem>
            <MenuItem style={{ marginLeft: 50 }}>
              <Typography onClick={handleBook} color="inherit">
                Quản lí Sách
              </Typography>
            </MenuItem>
            <MenuItem style={{ marginLeft: 50 }}>
              <Typography onClick={handleAuthor} color="inherit">
                Quản lí Tác giả
              </Typography>
            </MenuItem>
            <MenuItem style={{ marginLeft: 50 }}>
              <Typography onClick={handleCompany} color="inherit">
                Quản lí Công ty
              </Typography>
            </MenuItem>
          </Box>
          <Button onClick={handleLogout} color="inherit">
            Logout
          </Button>
        </Toolbar>
      </AppBar>
    </div>
  );
}
