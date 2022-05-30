const assert = require("assert");
const puppeteer = require("puppeteer");

const HEADLESS_MODE = process.env.HEADLESS_MODE || true;
const LANDING_PAGE = process.env.LANDING_PAGE || "http://localhost:8668"
const ERROR_PAGE = process.env.LANDING_PAGE || `${LANDING_PAGE}/error.html`;

describe("The error page for Virtual Arcade Bar website", () => {
  let browser;

  before(async () => {
    browser = await puppeteer.launch({
      headless: HEADLESS_MODE,
      args: ['--disable-dev-shm-usage']
    });
  });

  after(async () => {
    await browser.close();
  });

  it("Should have a 🔥 page title", async () => {
    const page = await browser.newPage();
    await page.goto(ERROR_PAGE);
    let title = await page.title();
    assert.equal(title, "Virtual Arcade Bar | Error Page");
  });

  it("Should describe an error", async () => {
    const page = await browser.newPage();
    await page.goto(ERROR_PAGE);

    const link = await page.$('#error');

    // If no HTML element is found, page.$ returns null
    assert.notEqual(link, null);
  });
});
