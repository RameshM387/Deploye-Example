import { LightningElement ,wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/wireExampleClass.getAccountList';

const columns = [
    { label : 'Name' , fieldName : 'Name' },
    { label : "Account record id" , fieldName : "Id"},
];
export default class WireExampleLWC extends LightningElement {

    @track columns = columns;
    @track data =[];

    @wire (getAccountList)
    wiredAccounts({data, error}){

        if(data){
            this.data = data;
        }
        else if(error){
            console.log('error occured');
        }
    }
}