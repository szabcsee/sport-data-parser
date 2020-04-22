import React, {Component} from 'react';


export class LoadSpinner extends Component {

    render() {
        return (
            <div className="loader center">
                <i className="fa fa-cog fa-spin"/>
            </div>
        );
    }
}

export default LoadSpinner;
