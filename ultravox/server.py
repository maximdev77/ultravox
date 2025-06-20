from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse

app = FastAPI()

@app.get("/")
async def root():
    return {"status": "Ultravox is running"}

@app.post("/webhook/twilio")
async def twilio_webhook(request: Request):
    data = await request.body()
    print("Received Twilio webhook:", data)
    return JSONResponse(content={"message": "ok"})
