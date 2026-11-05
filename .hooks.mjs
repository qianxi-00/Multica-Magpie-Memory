export async function onRequest(body, ctx) {
  return body;
}

export async function onResponse(_reply, _ctx) {
  // Best-effort notification only; persistence stays in the Python service.
}