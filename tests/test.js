const path = require('path');
const { compileToString } = require('node-elm-compiler')
const fs = require('fs');

const getFiles = (/** @type {string} */ source) =>
    fs.readdirSync(source, { withFileTypes: true })
        .filter(dirent => dirent.isFile())
        .map(dirent => dirent.name)

getFiles(path.join(__dirname, 'json-files')).forEach(jsonFilename => {
    const json = JSON.parse(fs.readFileSync(path.join(__dirname, 'json-files', jsonFilename)))
    Object.keys(json).forEach(key => {

        test(`${key}`, async () => {
            expect(json[key]).toMatchSnapshot();
        });

    })





})


async function runElm() {
    const elmSource = await compileToString(['src/Main.elm'], { output: 'elm.temp.js' })
    eval(elmSource.toString())
    // console.log('elm', Elm)
    // console.log('global', global)

    return new Promise(function (resolve, reject) {
        const app = Elm.Main.init({ flags: null });

        app.ports.snapshot.subscribe((snapshotValue) => {
            resolve(snapshotValue)
        })
    })
}

// runElm()
test('elm-snapshot-test', async () => {
    let snapshotValue = await runElm()
    console.log('snapshot', snapshotValue);

    expect(snapshotValue.value).toMatchSnapshot();
});