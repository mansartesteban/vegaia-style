import { createMemoryHistory, createRouter } from "vue-router";

let routes = [
  {
    name: "Spacings",
    url: "/spacings",
    component: () => import("@/views/Spacings.vue"),
  },
];

const router = createRouter({
  history: createMemoryHistory(),
  routes,
});

export default (app) => {
  app.use(router);
};
