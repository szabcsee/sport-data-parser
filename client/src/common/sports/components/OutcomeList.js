import React, {Component} from 'react';
import {DataTable} from 'primereact/datatable';
import {Column} from "primereact/column";

class OutcomeList extends Component {

    constructor() {
        super();
        this.state = {
            isLoading: true,
            eventId: null,
            outcomes: [],
            error: null
        };
    }

    componentDidMount() {
        this.fetchData(this.props.eventId);
    }

    componentDidUpdate(prevProps, prevState) {
        if (this.props.sportId && (prevProps.eventId !== this.props.eventId))
            this.fetchData(this.props.sportId);
    }

    fetchData(id) {
        fetch('http://localhost:3000/api/v1/sports/events/outcomes/outcome-by-event-id/' + id + '.json')
            .then(res => res.json())
            .then((data) => {
                if (data.result === 'error') {
                    this.setError(data.message);
                } else {
                    this.setState({
                        outcomes: data.items,
                        errorMessage: '',
                        isLoading: false
                    });
                }
            })
            .catch((e) => {
                this.setError(e.message);
            })
    }

    setError(errorMessage) {
        this.setState({error: errorMessage});
    }

    render() {
        if (this.state.isLoading)
            return <span>Loading...</span>;
        else {
            let cols = [
                    {field: 'id', header: 'Id'},
                    {field: 'market_id', header: 'Market Id'},
                    {field: 'description', header: 'Description'}
                ];

            let dynamicColumns = cols.map((col, i) => {
                return <Column key={col.field} field={col.field} header={col.header}/>;
            });

            return (
                <DataTable value={this.state.outcomes}>
                    {dynamicColumns}
                </DataTable>
            );
        }
    }
}

export default OutcomeList;