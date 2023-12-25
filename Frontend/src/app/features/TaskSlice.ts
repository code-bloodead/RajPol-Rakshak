import { PayloadAction, createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import axios from "axios";

export interface Task {
  id?: string;
  title: string;
  description: string;
  assigned_to: string[];
  image: string;
  created_at?: Date;
  deadline: string;
  status?: string;
  assc_incident: string;
  dept_name: string;
  station_name: string;
}

interface TaskState {
  data: Task[];
  loading: boolean;
  error: string | null;
}

const initialState: TaskState = {
  data: [],
  loading: false,
  error: null,
};

export const fetchTasks = createAsyncThunk(
  "task/fetch",
  async (payload: { deptName: string; stationName: string }, thunkAPI) => {
    try {
      const { deptName, stationName } = payload;
      const res = await axios.get(
        `${
          import.meta.env.VITE_BACKEND_URL
        }/tasks/get_task_by_dept?dept_name=${deptName}&station_name=${stationName}`
      );
      return res.data;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
);

export const addTask = createAsyncThunk(
  "task/add",
  async (payload: Task, thunkAPI) => {
    try {
      const res = await axios.post(
        `${import.meta.env.VITE_BACKEND_URL}/tasks/create_task`,
        payload
      );
      console.log(res.data);
      return res.data;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
);

export const deleteTask = createAsyncThunk(
  "task/delete",
  async (payload: { id: string }, thunkAPI) => {
    try {
      const { id } = payload;
      const res = await axios.delete(
        `${import.meta.env.VITE_BACKEND_URL}/tasks/delete_task?task_id=${id}`
      );
      return id;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
);

export const editTask = createAsyncThunk(
  "task/edit",
  async (payload: Task, thunkAPI) => {
    console.log(payload);
    try {
      const res = await axios.put(
        `${import.meta.env.VITE_BACKEND_URL}/tasks/update_task`,
        payload
      );
      console.log(res.data);
      return res.data;
    } catch (error) {
      console.log(error);
      throw error;
    }
  }
);

export const TaskSlice = createSlice({
  name: "tasks",
  initialState,
  reducers: {
    setTasks: (state, action: PayloadAction<Task[]>) => {
      state.data = action.payload;
      state.error = null;
    },
    clearTasks: (state) => {
      state.data = [];
      state.error = null;
    },
  },
  extraReducers: (builder) => {
    builder.addCase(fetchTasks.pending, (state) => {
      state.loading = true;
      state.error = null;
    });
    builder.addCase(fetchTasks.fulfilled, (state, action) => {
      state.data = action.payload.SUCCESS;
      state.loading = false;
      state.error = null;
    });
    builder.addCase(fetchTasks.rejected, (state, action) => {
      state.loading = false;
      state.error = action.error.message || null;
    });
    builder.addCase(addTask.pending, (state) => {
      state.loading = true;
      state.error = null;
    });
    builder.addCase(addTask.fulfilled, (state, action) => {
      state.data = [...state.data, action.payload.SUCCESS];
      state.loading = false;
      state.error = null;
    });
    builder.addCase(addTask.rejected, (state, action) => {
      state.loading = false;
      state.error = action.error.message || null;
    });
    builder.addCase(deleteTask.pending, (state) => {
      state.loading = true;
      state.error = null;
    });
    builder.addCase(deleteTask.fulfilled, (state, action) => {
      state.data = state.data.filter((task) => task.id !== action.payload);
      state.loading = false;
      state.error = null;
    });
    builder.addCase(deleteTask.rejected, (state, action) => {
      state.loading = false;
      state.error = action.error.message || null;
    });
    builder.addCase(editTask.pending, (state) => {
      state.loading = true;
      state.error = null;
    });
    builder.addCase(editTask.fulfilled, (state, action) => {
      state.data = state.data.map((task) =>
        task.id === action.payload.SUCCESS.id ? action.payload.SUCCESS : task
      );
      state.loading = false;
      state.error = null;
    });
    builder.addCase(editTask.rejected, (state, action) => {
      state.loading = false;
      state.error = action.error.message || null;
    });
  },
});

export const { setTasks, clearTasks } = TaskSlice.actions;
export default TaskSlice.reducer;
