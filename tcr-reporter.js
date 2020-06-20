'use strict';

// const simpleGit = require('simple-git');
// const util = require('util');
const reporterTypes = require('@jest/reporters/build/types')
const { span, spawn } = require('child_process')


class TcrReporter {

    constructor(globalConfig, options) {
        // this._revertBlacklistPattern = revertBlacklistPattern;
    }

    async onRunComplete(contexts, results) {
        console.log('results', results.snapshot);


        // const git = simpleGit(await this._getWorkspaceRootPath());
        // const execGit = (...args) => this._callGitFunction(git, ...args);

        if (this._isSuccess(results)) {

            // const message = await this._getLastCommitMessage(git);

            // await execGit('commit', message, {
            //     '--all': true
            // });
            console.log('Success! Time to commit.');
            spawn('osascript', ['commit-all.scpt'])
        }
        else {

            // const summary = await execGit('diffSummary');

            // const fileList = summary.files.map(fileInfo => fileInfo.file);

            // /* Skip files blacklisted from revert (e.g. spec files). */
            // const fileToRevertList = this._filterFilesToRevert(fileList);

            // await execGit('checkout', ['--', ...fileToRevertList]);
            console.log('Failure... update snapshots maybe?');


        }

    }

    // async _getWorkspaceRootPath() {
    //     const path = await this._callGitFunction(simpleGit(), 'revparse', [
    //         '--show-toplevel'
    //     ]);
    //     return path.trim();
    // }

    // async _getLastCommitMessage(git) {
    //     const result = await this._callGitFunction(git, 'log', [
    //         'HEAD~1..HEAD',
    //         '--pretty=%s',
    //     ]);
    //     return result.latest.hash;
    // }

    // _callGitFunction(git, name, ...args) {
    //     return util.promisify(git[name].bind(git))(...args);
    // }

    // _filterFilesToRevert(fileList) {

    //     if (this._revertBlacklistPattern == null) {
    //         return fileList;
    //     }

    //     return fileList.filter(file => !this._revertBlacklistPattern.test(file));

    // }

    _isSuccess(results) {
        /* `results.success` is false if no test is ran.
         * `numFailedTests` is 0 when there are syntax errors.
         * We'll use both numFailedTestSuites & numFailedTests to make sure it works. */
        return results.numFailedTests === 0 && results.numFailedTestSuites === 0;
    }
}

module.exports = TcrReporter;
