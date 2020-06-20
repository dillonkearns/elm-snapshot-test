const path = require('path');
const fs = require('fs');
const runElm = require('../run-elm');

// const getFiles = (/** @type {string} */ source) =>
//     fs.readdirSync(source, { withFileTypes: true })
//         .filter(dirent => dirent.isFile())
//         .map(dirent => dirent.name)
// 
// getFiles(path.join(__dirname, 'json-files')).forEach(jsonFilename => {
//     const json = JSON.parse(fs.readFileSync(path.join(__dirname, 'json-files', jsonFilename)))
//     Object.keys(json).forEach(key => {
//         test(`${key}`, async () => {
//             expect(json[key]).toMatchSnapshot();
//         });
//     })
// })
test('elm-snapshot-test', async () => {
    let snapshotValue = await runElm('src/Main.elm')
    expect(snapshotValue.value).toMatchSnapshot();
});