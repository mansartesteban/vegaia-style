import { defineConfig } from "vite"
import path from "path"
import AutoImport from "unplugin-auto-import/vite"
import Vue from "@vitejs/plugin-vue"

const root = path.resolve(__dirname)

export default defineConfig({
  plugins: [
    Vue(),
    AutoImport({
      imports: ["vue"],
    }),
  ],
  resolve: {
    alias: {
      "@": path.join(root),
    },
  },
  // css: {
  //   preprocessorOptions: {
  //     scss: {
  //       api: "modern",
  //     },
  //   },
  // },
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: ["style-loader", "css-loader", "sass-loader"],
      },
    ],
  },
})
