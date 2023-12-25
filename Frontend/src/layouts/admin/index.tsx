import { useEffect, useState } from "react";
import { Routes, Route, Navigate, useLocation } from "react-router-dom";
import Navbar from "@/components/navbar";
import Sidebar from "@/components/sidebar";
import Footer from "@/components/footer/Footer";
import routes from "@/routes";
import { fetchAdmin } from "@/app/features/AdminSlice";
import { useAppDispatch, useAppSelector } from "@/app/store";
import { fetchStaff } from "@/app/features/StaffSlice";
import { fetchIncidents } from "@/app/features/IncidentSlice";
import { fetchTasks } from "@/app/features/TaskSlice";
import { fetchNotifications } from "@/app/features/NotificationSlice";

export default function Admin(props: { [x: string]: any }) {
  const { ...rest } = props;
  const location = useLocation();
  const dispatch = useAppDispatch();
  const [open, setOpen] = useState(true);
  const [currentRoute, setCurrentRoute] = useState("Dashboard");
  const admin = useAppSelector((state) => state.admin.data);

  useEffect(() => {
    window.addEventListener("resize", () =>
      window.innerWidth < 1200 ? setOpen(false) : setOpen(true)
    );
  }, []);

  useEffect(() => {
    const handleReload = () => {
      dispatch(fetchAdmin(localStorage.getItem("id") as string));
    };
    window.addEventListener("load", handleReload);
    return () => {
      window.removeEventListener("load", handleReload);
    };
  }, [dispatch]);

  useEffect(() => {
    const fetchData = () => {
      if (!admin || admin.dept_name === "" || admin.station_name === "") {
        fetchAdmin(localStorage.getItem("id") as string);
        return;
      }
      dispatch(
        fetchIncidents({
          deptName: admin.dept_name,
          stationName: admin.station_name,
        })
      );
      dispatch(
        fetchStaff({
          deptName: admin.dept_name,
          stationName: admin.station_name,
        })
      );
      dispatch(
        fetchTasks({
          deptName: admin.dept_name,
          stationName: admin.station_name,
        })
      );
      dispatch(
        fetchNotifications({
          deptName: admin.dept_name,
          stationName: admin.station_name,
        })
      );
    };

    fetchData();

    // const interval = setInterval(fetchData, 60000);
    // return () => clearInterval(interval);
  }, [admin, dispatch]);

  useEffect(() => {
    getActiveRoute(routes);
  }, [location.pathname]);

  const getActiveRoute = (routes: RoutesType[]): void => {
    for (let i = 0; i < routes.length; i++) {
      if (
        window.location.href.indexOf(
          routes[i].layout + "/" + routes[i].path
        ) !== -1
      ) {
        setCurrentRoute(routes[i].name);
      }
    }
  };
  const getActiveNavbar = (routes: RoutesType[]): string | boolean => {
    let activeNavbar = false;
    for (let i = 0; i < routes.length; i++) {
      if (
        window.location.href.indexOf(routes[i].layout + routes[i].path) !== -1
      ) {
        return routes[i].secondary;
      }
    }
    return activeNavbar;
  };
  const getRoutes = (routes: RoutesType[]): any => {
    return routes.map((prop, key) => {
      var layout;
      if (location.pathname.includes("dept-admin")) {
        layout = "/dept-admin";
      } else if (location.pathname.includes("station-admin")) {
        layout = "/station-admin";
      }
      if (prop.layout === layout) {
        return (
          <Route path={`/${prop.path}`} element={prop.component} key={key} />
        );
      } else {
        return null;
      }
    });
  };

  document.documentElement.dir = "ltr";
  return (
    <div className="flex h-full w-full">
      <Sidebar open={open} onClose={() => setOpen(false)} />
      {/* Navbar & Main Content */}
      <div className="h-full w-full bg-lightPrimary dark:!bg-navy-900">
        {/* Main Content */}
        <main
          className={`mx-[12px] h-full flex-none transition-all md:pr-2 xl:ml-[300px]`}
        >
          {/* Routes */}
          <div className="h-full">
            <Navbar
              currentRoute={currentRoute}
              onOpenSidenav={() => setOpen(true)}
              brandText={currentRoute}
              secondary={getActiveNavbar(routes)}
              {...rest}
            />
            <div className="pt-5s mx-auto mb-auto h-full min-h-[84vh] p-2 md:pr-2">
              <Routes>
                {getRoutes(routes)}

                <Route
                  path="/"
                  element={<Navigate to="/auth/sign-in" replace />}
                />
              </Routes>
            </div>
            <div className="p-3">
              <Footer />
            </div>
          </div>
        </main>
      </div>
    </div>
  );
}
