FROM mcr.microsoft.com/playwright:v1.52.0-jammy

WORKDIR /app

# Playwright MCP パッケージをインストール
RUN npm install -g @playwright/mcp@latest

# ヘッドレスChromiumのみ使用（軽量化）
RUN npx playwright install chromium --with-deps

ENV PORT=8080
EXPOSE 8080

# SSEモードで起動（HTTP経由でMCPを公開）
CMD ["npx", "@playwright/mcp", "--port", "8080", "--headless"]
