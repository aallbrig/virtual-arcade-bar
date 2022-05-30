const assert = require("assert");
const puppeteer = require("puppeteer");

const HEADLESS_MODE = process.env.HEADLESS_MODE || true;
const LANDING_PAGE = process.env.LANDING_PAGE || "http://localhost:8668";

describe("The landing page for Virtual Arcade Bar website", () => {
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
    await page.goto(LANDING_PAGE);
    let title = await page.title();
    assert.equal(title, "Virtual Arcade Bar | Landing Page");
  });

  it("Should summarize what the website is", async () => {
    const page = await browser.newPage();
    await page.goto(LANDING_PAGE);

    const projectSummarySection = await page.$('#project-summary-section');

    // If no HTML element is found, page.$ returns null
    assert.notEqual(projectSummarySection, null);
  });

  it("Should Have a QR Code to share page with others", async () => {
    const page = await browser.newPage();
    await page.goto(LANDING_PAGE);

    const link = await page.$('#website-qr-code');

    // If no HTML element is found, page.$ returns null
    assert.notEqual(link, null);
  });

  it("Should have a link to a webGL video game page", async () => {
    const page = await browser.newPage();
    await page.goto(LANDING_PAGE);

    const link = await page.$('#link-to-virtual-arcade-bar');

    // If no HTML element is found, page.$ returns null
    assert.notEqual(link, null);
  });
});
