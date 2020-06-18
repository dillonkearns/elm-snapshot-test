const { compileToString } = require('node-elm-compiler')


module.exports = async function runElm(path) {
    const elmSource = await compileToString([path], { output: 'elm.temp.js' })
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