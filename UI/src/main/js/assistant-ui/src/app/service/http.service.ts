import {HttpClient, HttpHeaders} from '@angular/common/http';


export abstract class HttpService {

  protected API_URL = 'http://localhost:8080';

  protected API_DUMMY = '/dummy';

  protected API_LIST = '/list';

  protected API_UPDATE = '/update';

  protected API_CREATE = '/add';

}
