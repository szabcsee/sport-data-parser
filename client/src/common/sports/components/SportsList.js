import React, {Component } from 'react';
import PropTypes from 'prop-types';

class SportsList extends Component {

    render () {
        let sports = this.props.sports;

    }
}

SportsList.propTypes = {
    sports: PropTypes.array.isRequired
};

export default SportsList;