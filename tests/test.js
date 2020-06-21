const path = require('path');
const fs = require('fs');
const runElm = require('../run-elm');
const { Elm } = require('../src/Main.elm')

function getSnapshot() {
    return new Promise(function (resolve, reject) {
        const app = Elm.Main.init({ flags: null });

        app.ports.snapshot.subscribe((snapshotValue) => {
            resolve(snapshotValue)
        })
    })
}

test('elm-snapshot-test', async () => {
    const snapshotValue = await getSnapshot()
    expect(snapshotValue.value).toMatchSnapshot();
});