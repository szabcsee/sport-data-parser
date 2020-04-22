import React, { Component } from 'react';

export class AppFooter extends Component {

    render() {
        return  (
            <div className="layout-footer">
                <span className="footer-text" style={{'marginRight': '5px'}}>BetVictor</span>
                <span className="footer-text" style={{'marginLeft': '5px'}}>Rails and React test excersise by Szabolcs Bokonyi</span>
            </div>
        );
    }
}