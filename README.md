# rotori-web

Rotori (Japonya seyahat planlayıcı) tanıtım sitesi — statik HTML,
Raspberry Pi 5'te Docker (nginx:alpine) ile serve edilir, Cloudflare
Tunnel üzerinden **[rotori.app](https://rotori.app)** olarak yayına
çıkar.

## Mimari

```
Kullanıcı → Cloudflare (TLS, CDN, DDoS) → Tunnel → Pi'de :3080 → nginx → public/
```

Router port forward yok. Dinamik IP değişebilir, tunnel etkilenmez.

## Yerel çalıştırma

```bash
docker compose up -d --build
open http://localhost:3080
```

## Deploy (Pi'de)

İlk kez:
```bash
git clone git@github.com:mennansevim/rotori-web.git
cd rotori-web
docker compose up -d --build
```

Güncelleme:
```bash
cd ~/rotori-web
./deploy.sh
```

## İçerik güncelleme

Ana kaynak: [`japan-trip/website/index.html`](https://github.com/mennansevim/japan-trip/blob/main/website/index.html).  
Bu repo'ya kopyala → commit → push → Pi'de `./deploy.sh`.

## Ports

- Container iç: **80**
- Host: **3080** (Cloudflare Tunnel `http://localhost:3080` okur)

## Sağlık kontrolü

`GET /healthz` → `200 ok`. Docker healthcheck de bunu kullanır.
